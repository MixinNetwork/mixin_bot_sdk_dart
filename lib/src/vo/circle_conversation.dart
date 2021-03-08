import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'circle_conversation.g.dart';

@JsonSerializable()
class CircleConversation with EquatableMixin {
  @JsonKey(name: 'conversation_id', disallowNullValue: true)
  String conversationId;
  @JsonKey(name: 'circle_id', disallowNullValue: true)
  String circleId;
  @JsonKey(name: 'user_id', disallowNullValue: false)
  String? userId;
  @JsonKey(name: 'created_at', disallowNullValue: true)
  DateTime createdAt;
  String pinTime;

  CircleConversation({
    required this.conversationId,
    required this.circleId,
    this.userId,
    required this.createdAt,
    required this.pinTime,
  });

  factory CircleConversation.fromJson(Map<String, dynamic> json) =>
      _$CircleConversationFromJson(json);

  Map<String, dynamic> toJson() => _$CircleConversationToJson(this);

  @override
  List<Object?> get props => [
        conversationId,
        circleId,
        userId,
        createdAt,
        pinTime,
      ];
}

enum CircleConversationAction { add, remove }
