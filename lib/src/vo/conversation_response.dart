import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'circle_conversation.dart';
import 'participant_request.dart';
import 'user_session.dart';

part 'conversation_response.g.dart';

@JsonSerializable()
class ConversationResponse with EquatableMixin {
  @JsonKey(name: 'conversation_id', nullable: false)
  String conversationId;
  @JsonKey(name: 'name', nullable: false)
  String name;
  @JsonKey(name: 'creator_id', nullable: false)
  String creatorId;
  @JsonKey(name: 'icon_url', nullable: false)
  String iconUrl;
  @JsonKey(name: 'code_url', nullable: false)
  String codeUrl;
  @JsonKey(name: 'announcement', nullable: false)
  String announcement;
  @JsonKey(name: 'created_at', nullable: false)
  String createdAt;
  @JsonKey(name: 'participants', nullable: false)
  List<ParticipantRequest> participants;
  @JsonKey(name: 'participant_sessions', nullable: true)
  List<UserSession> participantSessions;
  @JsonKey(name: 'circles', nullable: true)
  List<CircleConversation> circles;
  @JsonKey(name: 'mute_until', nullable: false)
  String muteUntil;

  ConversationResponse({
    this.conversationId,
    this.name,
    this.iconUrl,
    this.codeUrl,
    this.createdAt,
    this.participants,
    this.participantSessions,
    this.circles,
    this.muteUntil,
  });

  factory ConversationResponse.fromJson(Map<String, dynamic> json) =>
      _$ConversationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationResponseToJson(this);

  @override
  List<Object> get props => [
        conversationId,
        name,
        iconUrl,
        codeUrl,
        createdAt,
        participants,
        participantSessions,
        circles,
        muteUntil,
      ];
}
