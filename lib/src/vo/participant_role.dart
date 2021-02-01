import 'package:json_annotation/json_annotation.dart';

enum ParticipantRole {
  @JsonValue('OWNER')
  owner,
  @JsonValue('ADMIN')
  admin,
}
