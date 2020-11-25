import 'package:bot_api_dart_client/src/vo/participant_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation_request.g.dart';

@JsonSerializable()
class ConversationRequest {
  @JsonKey(name: 'conversation_id', nullable: false)
  String conversationId;
  @JsonKey(name: 'category', nullable: true)
  String category;
  @JsonKey(name: 'name', nullable: false)
  String name;
  @JsonKey(name: 'icon_base64', nullable: true)
  String iconBase64;
  @JsonKey(name: 'announcement', nullable: true)
  String announcement;
  @JsonKey(name: 'participants', nullable: true)
  List<ParticipantRequest> participants;
  @JsonKey(name: 'duration', nullable: true)
  int duration;

  ConversationRequest(
      {this.conversationId,
      this.category,
      this.name,
      this.iconBase64,
      this.announcement,
      this.participants,
      this.duration});

  factory ConversationRequest.fromJson(Map<String, dynamic> json) =>
      _$ConversationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationRequestToJson(this);
}
