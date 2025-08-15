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
    this.randomId,
  });

  factory ConversationRequest.fromJson(Map<String, dynamic> json) =>
      _$ConversationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationRequestToJson(this);

  @JsonKey(name: 'conversation_id')
  final String conversationId;
  @JsonKey(name: 'category')
  final ConversationCategory? category;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'icon_base64')
  final String? iconBase64;
  @JsonKey(name: 'announcement')
  final String? announcement;
  @JsonKey(name: 'participants')
  final List<ParticipantRequest>? participants;
  @JsonKey(name: 'duration')
  final int? duration;
  @JsonKey(name: 'random_id')
  final String? randomId;

  @override
  List<Object?> get props => [
        conversationId,
        category,
        name,
        iconBase64,
        announcement,
        participants,
        duration,
        randomId,
      ];
}
