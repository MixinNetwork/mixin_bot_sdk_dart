import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../conversation_category.dart';
import 'participant_request.dart';

part 'conversation_request.g.dart';

@JsonSerializable()
@ConversationCategoryJsonConverter()
class ConversationRequest with EquatableMixin {
  ConversationRequest({
    required this.conversationId,
    this.category,
    this.name,
    this.iconBase64,
    this.announcement,
    this.participants,
    this.duration,
  });

  factory ConversationRequest.fromJson(Map<String, dynamic> json) =>
      _$ConversationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationRequestToJson(this);

  @JsonKey(name: 'conversation_id')
  String conversationId;
  @JsonKey(name: 'category')
  ConversationCategory? category;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'icon_base64')
  String? iconBase64;
  @JsonKey(name: 'announcement')
  String? announcement;
  @JsonKey(name: 'participants')
  List<ParticipantRequest>? participants;
  @JsonKey(name: 'duration')
  int? duration;

  @override
  List<Object?> get props => [
        conversationId,
        category,
        name,
        iconBase64,
        announcement,
        participants,
        duration,
      ];
}
