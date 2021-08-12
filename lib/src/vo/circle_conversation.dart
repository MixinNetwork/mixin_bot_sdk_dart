import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'circle_conversation.g.dart';

@JsonSerializable()
class CircleConversation with EquatableMixin {
  CircleConversation({
    required this.conversationId,
    required this.circleId,
    required this.createdAt,
    required this.pinTime,
    this.userId,
  });

  factory CircleConversation.fromJson(Map<String, dynamic> json) =>
      _$CircleConversationFromJson(json);

  Map<String, dynamic> toJson() => _$CircleConversationToJson(this);

  @JsonKey(name: 'conversation_id')
  String conversationId;
  @JsonKey(name: 'circle_id')
  String circleId;
  @JsonKey(name: 'user_id')
  String? userId;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  String? pinTime;

  @override
  List<Object?> get props => [
        conversationId,
        circleId,
        userId,
        createdAt,
        pinTime,
      ];
}
