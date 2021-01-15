import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'circle_conversation.g.dart';

@JsonSerializable()
class CircleConversation with EquatableMixin {
  @JsonKey(name: 'conversationd_id', nullable: false)
  String conversationId;
  @JsonKey(name: 'circle_id', nullable: false)
  String circleId;
  @JsonKey(name: 'user_id', nullable: true)
  String userId;
  @JsonKey(name: 'created_at', nullable: false)
  DateTime createdAt;
  String pinTime;

  CircleConversation({
    this.conversationId,
    this.circleId,
    this.userId,
    this.createdAt,
    this.pinTime,
  });

  factory CircleConversation.fromJson(Map<String, dynamic> json) =>
      _$CircleConversationFromJson(json);

  Map<String, dynamic> toJson() => _$CircleConversationToJson(this);

  @override
  List<Object> get props => [
    conversationId,
    circleId,
    userId,
    createdAt,
    pinTime,
  ];
}

enum CircleConversationAction { add, remove }
