import 'package:json_annotation/json_annotation.dart';

enum UserRelationship {
  @JsonValue('FRIEND')
  friend,
  @JsonValue('ME')
  me,
  @JsonValue('STRANGER')
  stranger,
  @JsonValue('BLOCKING')
  blocking,
}
