import 'package:json_annotation/json_annotation.dart';

enum ConversationCategory {
  @JsonValue('CONTACT')
  contact,
  @JsonValue('GROUP')
  group
}
