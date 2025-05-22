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
  final String conversationId;
  @JsonKey(name: 'circle_id')
  final String circleId;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final String? pinTime;

  @override
  List<Object?> get props => [
        conversationId,
        circleId,
        userId,
        createdAt,
        pinTime,
      ];
}
