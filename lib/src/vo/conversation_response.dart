import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import './request/participant_request.dart';
import 'circle_conversation.dart';
import 'code_type_interface.dart';
import 'conversation_category.dart';
import 'user_session.dart';

part 'conversation_response.g.dart';

@JsonSerializable()
@ConversationCategoryJsonConverter()
class ConversationResponse with EquatableMixin, CodeTypeInterface {
  ConversationResponse({
    required this.conversationId,
    required this.name,
    required this.category,
    required this.iconUrl,
    required this.codeUrl,
    required this.createdAt,
    required this.participants,
    required this.muteUntil,
    required this.announcement,
    required this.creatorId,
    required this.expireIn,
    this.participantSessions,
    this.circles,
  });

  factory ConversationResponse.fromJson(Map<String, dynamic> json) =>
      _$ConversationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationResponseToJson(this);

  @JsonKey(name: 'conversation_id')
  String conversationId;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'category')
  ConversationCategory? category;
  @JsonKey(name: 'creator_id')
  String creatorId;
  @JsonKey(name: 'icon_url')
  String iconUrl;
  @JsonKey(name: 'code_url')
  String codeUrl;
  @JsonKey(name: 'announcement')
  String announcement;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  @JsonKey(name: 'participants')
  List<ParticipantRequest> participants;
  @JsonKey(name: 'participant_sessions')
  List<UserSession>? participantSessions;
  @JsonKey(name: 'circles')
  List<CircleConversation>? circles;
  @JsonKey(name: 'mute_until')
  String muteUntil;

  @JsonKey(name: 'expire_in', defaultValue: 0)
  int expireIn;

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
        expireIn,
      ];
}
