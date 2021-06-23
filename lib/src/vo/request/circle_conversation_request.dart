import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'circle_conversation_request.g.dart';

@JsonSerializable()
class CircleConversationRequest with EquatableMixin {
  CircleConversationRequest({
    required this.conversationId,
    required this.action,
    this.userId,
  });

  factory CircleConversationRequest.fromJson(Map<String, dynamic> json) =>
      _$CircleConversationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CircleConversationRequestToJson(this);

  @JsonKey(name: 'conversation_id', disallowNullValue: true)
  String conversationId;
  @JsonKey(name: 'action', disallowNullValue: true)
  CircleConversationAction action;
  @JsonKey(name: 'user_id', disallowNullValue: true)
  String? userId;

  @override
  List<Object?> get props => [conversationId, action, userId];
}

enum CircleConversationAction {
  @JsonValue('ADD')
  add,
  @JsonValue('REMOVE')
  remove,
}
