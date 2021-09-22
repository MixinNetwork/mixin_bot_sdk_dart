import 'package:json_annotation/json_annotation.dart';
import 'package:recase/recase.dart';

bool _isEnumItem(enumItem) {
  final splitEnum = enumItem.toString().split('.');
  return splitEnum.length > 1 &&
      splitEnum[0] == enumItem.runtimeType.toString();
}

String? enumConvertToString(dynamic enumItem) {
  if (enumItem == null) return null;
  assert(_isEnumItem(enumItem),
      '$enumItem of type ${enumItem.runtimeType.toString()} is not an enum item');
  final _tmp = enumItem.toString().split('.')[1];
  return _tmp;
}

T? fromStringToEnum<T>(List<T?>? enumValues, String? value) {
  if (value == null || enumValues == null) return null;

  return enumValues.cast<T?>().singleWhere(
        (enumItem) =>
            enumConvertToString(enumItem)?.toUpperCase() == value.toUpperCase(),
        orElse: () => null,
      );
}

abstract class EnumJsonConverter<T> implements JsonConverter<T?, String?> {
  const EnumJsonConverter();

  List<T> enumValues();

  String get unknownJson => '';

  T? get unknownEnumValue => null;

  @override
  T? fromJson(String? json) =>
      fromStringToEnum(
        enumValues(),
        json?.camelCase,
      ) ??
      unknownEnumValue;

  @override
  String? toJson(T? object) =>
      jsonCase(enumConvertToString(object)) ?? jsonCase(unknownJson);

  String? jsonCase(String? json) => json?.constantCase;
}
