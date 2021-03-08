import 'package:equatable/equatable.dart';

import '../../mixin_bot_sdk_dart.dart';
import '../vo/participant_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation_request.g.dart';

@JsonSerializable()
@ConversationCategoryJsonConverter()
class ConversationRequest with EquatableMixin {
  @JsonKey(name: 'conversation_id', disallowNullValue: true)
  String conversationId;
  @JsonKey(name: 'category', disallowNullValue: false)
  ConversationCategory? category;
  @JsonKey(name: 'name', disallowNullValue: true)
  String? name;
  @JsonKey(name: 'icon_base64', disallowNullValue: false)
  String? iconBase64;
  @JsonKey(name: 'announcement', disallowNullValue: false)
  String? announcement;
  @JsonKey(name: 'participants', disallowNullValue: false)
  List<ParticipantRequest>? participants;
  @JsonKey(name: 'duration', disallowNullValue: false)
  int? duration;

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
