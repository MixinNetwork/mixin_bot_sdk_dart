import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../mixin_bot_sdk_dart.dart';

part 'conversation.g.dart';

@JsonSerializable()
@ConversationCategoryJsonConverter()
@ConversationStatusJsonConverter()
class Conversation with EquatableMixin {
  @JsonKey(name: 'conversation_id')
  String conversationId;
  @JsonKey(name: 'owner_id')
  String? ownerId;
  @JsonKey(name: 'category')
  ConversationCategory? category;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'announcement')
  String? announcement;
  @JsonKey(name: 'icon_url')
  String? iconUrl;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  @JsonKey(name: 'pin_time')
  DateTime? pinedAt;
  @JsonKey(name: 'last_message_id')
  String? lastMessageId;
  @JsonKey(name: 'last_read_message_id')
  String? lastReadMessageId;
  @JsonKey(name: 'unseen_message_count')
  int? unseenMessageCount;
  @JsonKey(name: 'status')
  ConversationStatus status;
  @JsonKey(name: 'draft')
  String? draft;
  @JsonKey(name: 'mute_until')
  String? muteUntil;

  bool get isGroup => ConversationCategory.group == category;

  bool get isContact => ConversationCategory.contact == category;

  Conversation({
    required this.conversationId,
    this.name,
    this.ownerId,
    this.category,
    this.announcement,
    this.iconUrl,
    required this.createdAt,
    this.pinedAt,
    this.lastMessageId,
    this.lastReadMessageId,
    this.unseenMessageCount,
    required this.status,
    this.draft,
    this.muteUntil,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationToJson(this);

  @override
  List<Object?> get props => [
        conversationId,
        name,
        ownerId,
        category,
        announcement,
        iconUrl,
        createdAt,
        pinedAt,
        lastMessageId,
        lastReadMessageId,
        unseenMessageCount,
        status,
        draft,
        muteUntil,
      ];
}

enum ConversationStatus {
  start,
  failure,
  success,
  quit,
}

class ConversationStatusJsonConverter
    implements JsonConverter<ConversationStatus, int?> {
  const ConversationStatusJsonConverter();

  @override
  ConversationStatus fromJson(int? json) =>
      ConversationStatus.values[json ?? ConversationStatus.failure.index];

  @override
  int? toJson(ConversationStatus? object) =>
      object?.index ?? ConversationStatus.failure.index;
}
