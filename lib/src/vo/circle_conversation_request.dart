import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'circle_conversation_request.g.dart';

@JsonSerializable()
class CircleConversationRequest with EquatableMixin {
  @JsonKey(name: 'conversation_id', disallowNullValue: true)
  String name;
  @JsonKey(name: 'action', disallowNullValue: true)
  CircleConversationAction action;
  @JsonKey(name: 'user_id', disallowNullValue: true)
  String? userId;

  CircleConversationRequest({
    required this.name,
    required this.action,
    this.userId,
  });

  factory CircleConversationRequest.fromJson(Map<String, dynamic> json) =>
      _$CircleConversationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CircleConversationRequestToJson(this);

  @override
  List<Object?> get props => [name, action, userId];
}

enum CircleConversationAction { ADD, REMOVE }