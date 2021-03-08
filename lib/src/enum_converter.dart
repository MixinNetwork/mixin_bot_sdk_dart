import 'package:enum_to_string/enum_to_string.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:recase/recase.dart';

abstract class EnumStringJsonConverter<T>
    implements JsonConverter<T?, String?> {
  const EnumStringJsonConverter();

  List<T> enumValues();

  String get unkonwnJson => '';

  T? get unknownEnumValue => null;

  @override
  T? fromJson(String? json) {
    if (json != null) {
      return EnumToString.fromString(
        enumValues(),
        json.camelCase,
      );
    }
    return unknownEnumValue;
  }

  @override
  String? toJson(T? object) =>
      jsonCase(EnumToString.convertToString(object)) ?? jsonCase(unkonwnJson);

  String? jsonCase(String? json) => json?.constantCase;
}
