import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'circle_conversation.dart';
import 'conversation_category.dart';
import 'participant_request.dart';
import 'user_session.dart';

part 'conversation_response.g.dart';

@JsonSerializable()
@ConversationCategoryJsonConverter()
class ConversationResponse with EquatableMixin {
  @JsonKey(name: 'conversation_id', disallowNullValue: true)
  String conversationId;
  @JsonKey(name: 'name', disallowNullValue: true)
  String name;
  @JsonKey(name: 'category', disallowNullValue: true)
  ConversationCategory category;
  @JsonKey(name: 'creator_id', disallowNullValue: true)
  String creatorId;
  @JsonKey(name: 'icon_url', disallowNullValue: true)
  String iconUrl;
  @JsonKey(name: 'code_url', disallowNullValue: true)
  String codeUrl;
  @JsonKey(name: 'announcement', disallowNullValue: true)
  String announcement;
  @JsonKey(name: 'created_at', disallowNullValue: true)
  DateTime createdAt;
  @JsonKey(name: 'participants', disallowNullValue: true)
  List<ParticipantRequest> participants;
  @JsonKey(name: 'participant_sessions', disallowNullValue: false)
  List<UserSession>? participantSessions;
  @JsonKey(name: 'circles', disallowNullValue: false)
  List<CircleConversation>? circles;
  @JsonKey(name: 'mute_until', disallowNullValue: true)
  String muteUntil;

  ConversationResponse({
    required this.conversationId,
    required this.name,
    required this.category,
    required this.iconUrl,
    required this.codeUrl,
    required this.createdAt,
    required this.participants,
    this.participantSessions,
    this.circles,
    required this.muteUntil,
    required this.announcement,
    required this.creatorId,
  });

  factory ConversationResponse.fromJson(Map<String, dynamic> json) =>
      _$ConversationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationResponseToJson(this);

  @override
  List<Object?> get props => [
        conversationId,
        name,
        category,
        iconUrl,
        codeUrl,
        createdAt,
        participants,
        participantSessions,
        circles,
        muteUntil,
      ];
}
