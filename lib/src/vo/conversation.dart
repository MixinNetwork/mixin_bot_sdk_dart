import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../mixin_bot_sdk_dart.dart';

part 'conversation.g.dart';

@JsonSerializable()
@ConversationCategoryJsonConverter()
@ConversationStatusJsonConverter()
class Conversation with EquatableMixin {
  Conversation({
    required this.conversationId,
    required this.createdAt,
    required this.status,
    this.name,
    this.ownerId,
    this.category,
    this.announcement,
    this.iconUrl,
    this.pinedAt,
    this.lastMessageId,
    this.lastReadMessageId,
    this.unseenMessageCount,
    this.draft,
    this.muteUntil,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationToJson(this);

  @JsonKey(name: 'conversation_id')
  final String conversationId;
  @JsonKey(name: 'owner_id')
  final String? ownerId;
  @JsonKey(name: 'category')
  final ConversationCategory? category;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'announcement')
  final String? announcement;
  @JsonKey(name: 'icon_url')
  final String? iconUrl;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'pin_time')
  final DateTime? pinedAt;
  @JsonKey(name: 'last_message_id')
  final String? lastMessageId;
  @JsonKey(name: 'last_read_message_id')
  final String? lastReadMessageId;
  @JsonKey(name: 'unseen_message_count')
  final int? unseenMessageCount;
  @JsonKey(name: 'status')
  final ConversationStatus status;
  @JsonKey(name: 'draft')
  final String? draft;
  @JsonKey(name: 'mute_until')
  final String? muteUntil;

  bool get isGroup => ConversationCategory.group == category;

  bool get isContact => ConversationCategory.contact == category;

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
