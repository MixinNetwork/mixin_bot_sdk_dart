import 'package:json_annotation/json_annotation.dart';
import 'package:recase/recase.dart';

bool _isEnumItem(dynamic enumItem) {
  final splitEnum = enumItem.toString().split('.');
  return splitEnum.length > 1 &&
      splitEnum[0] == enumItem.runtimeType.toString();
}

String? enumConvertToString(dynamic enumItem) {
  if (enumItem == null) return null;
  assert(
    _isEnumItem(enumItem),
    '$enumItem of type ${enumItem.runtimeType} is not an enum item',
  );
  final tmp = enumItem.toString().split('.')[1];
  return tmp;
}

// Conversions by enum values list, then by input. A conversion scanned every
// enum item and allocated several strings for each, and an app converts
// several columns of every database row. Inputs come from a small set, and a
// list keeps at most [_maxCachedInputs] of them.
final _enumLookups = Expando<Map<String, Object?>>();
final _jsonLookups = Expando<Map<String, Object?>>();
const _maxCachedInputs = 256;

T? _cached<T>(
  Expando<Map<String, Object?>> lookups,
  List<T?> enumValues,
  String value,
  T? Function() convert,
) {
  final lookup = lookups[enumValues] ??= <String, Object?>{};
  if (lookup.containsKey(value)) return lookup[value] as T?;
  final result = convert();
  if (lookup.length < _maxCachedInputs) lookup[value] = result;
  return result;
}

T? fromStringToEnum<T>(List<T?>? enumValues, String? value) {
  if (value == null || enumValues == null) return null;

  return _cached(
    _enumLookups,
    enumValues,
    value,
    () => enumValues.cast<T?>().singleWhere(
      (enumItem) =>
          enumConvertToString(enumItem)?.toUpperCase() == value.toUpperCase(),
      orElse: () => null,
    ),
  );
}

abstract class EnumJsonConverter<T> implements JsonConverter<T?, String?> {
  const EnumJsonConverter();

  List<T> enumValues();

  String get unknownJson => '';

  T? get unknownEnumValue => null;

  @override
  T? fromJson(String? json) {
    if (json == null) return unknownEnumValue;
    final values = enumValues();
    return _cached(
          _jsonLookups,
          values,
          json,
          () => fromStringToEnum(values, json.camelCase),
        ) ??
        unknownEnumValue;
  }

  @override
  String? toJson(T? object) =>
      jsonCase(enumConvertToString(object)) ?? jsonCase(unknownJson);

  String? jsonCase(String? json) => json?.constantCase;
}
