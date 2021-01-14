import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation.g.dart';

@JsonSerializable()
class Conversation with EquatableMixin {
  @JsonKey(name: 'conversation_id', nullable: false)
  String conversationId;
  @JsonKey(name: 'owner_id', nullable: true)
  String ownerId;
  @JsonKey(name: 'category', nullable: false)
  String category;
  @JsonKey(name: 'name', nullable: true)
  String name;
  @JsonKey(name: 'announcement', nullable: true)
  String announcement;
  @JsonKey(name: 'icon_url', nullable: true)
  String iconUrl;
  @JsonKey(name: 'created_at', nullable: false)
  DateTime createdAt;
  @JsonKey(name: 'pin_time', nullable: true)
  String pinTime;
  @JsonKey(name: 'last_message_id', nullable: true)
  String lastMessageId;
  @JsonKey(name: 'last_read_message_id', nullable: true)
  String lastReadMessageId;
  @JsonKey(name: 'unseen_message_count', nullable: true)
  String unseenMessageCount;
  @JsonKey(name: 'status', nullable: false)
  int status;
  @JsonKey(name: 'draft', nullable: true)
  String draft;
  @JsonKey(name: 'mute_until', nullable: true)
  String muteUntil;

  Conversation({
    this.conversationId,
    this.name,
    this.ownerId,
    this.category,
    this.announcement,
    this.iconUrl,
    this.createdAt,
    this.pinTime,
    this.lastMessageId,
    this.lastReadMessageId,
    this.unseenMessageCount,
    this.status,
    this.draft,
    this.muteUntil,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationToJson(this);

  @override
  List<Object> get props => [
    conversationId,
    name,
    ownerId,
    category,
    announcement,
    iconUrl,
    createdAt,
    pinTime,
    lastMessageId,
    lastReadMessageId,
    unseenMessageCount,
    status,
    draft,
    muteUntil,
  ];
}

enum ConversationCategory { contact, group }
enum ConversationStatus { start, failure, success, quit }

extension on Conversation {
  // ignore: unused_element
  bool isGroup() => category == ConversationCategory.group.toString();

  // ignore: unused_element
  bool isContact() => category == ConversationCategory.contact.toString();
}
