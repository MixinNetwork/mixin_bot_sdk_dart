import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../mixin_bot_sdk_dart.dart';

part 'account.g.dart';

@JsonSerializable()
@UserRelationshipJsonConverter()
class Account with EquatableMixin {
  Account({
    required this.userId,
    required this.identityNumber,
    required this.phone,
    required this.biography,
    required this.relationship,
    required this.muteUntil,
    required this.createdAt,
    required this.isVerified,
    required this.isScam,
    required this.sessionId,
    required this.pinToken,
    required this.pinTokenBase64,
    required this.codeId,
    required this.codeUrl,
    required this.deviceStatus,
    required this.hasSafe,
    required this.hasPin,
    required this.hasEmergencyContact,
    required this.receiveMessageSource,
    required this.acceptConversationSource,
    required this.acceptSearchSource,
    required this.fiatCurrency,
    required this.transferNotificationThreshold,
    required this.transferConfirmationThreshold,
    required this.tipCounter,
    required this.tipKeyBase64,
    this.fullName,
    this.avatarUrl,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  @JsonKey(name: 'user_id')
  String userId;
  @JsonKey(name: 'identity_number')
  String identityNumber;
  @JsonKey(name: 'phone')
  String phone;
  @JsonKey(name: 'full_name')
  String? fullName;
  @JsonKey(name: 'biography')
  String biography;
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;
  @JsonKey(name: 'relationship')
  UserRelationship? relationship;
  @JsonKey(name: 'mute_until')
  String muteUntil;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  @JsonKey(name: 'is_verified')
  bool isVerified;
  @JsonKey(name: 'is_scam')
  bool isScam;
  @JsonKey(name: 'session_id')
  String sessionId;
  @JsonKey(name: 'pin_token')
  String pinToken;
  @JsonKey(name: 'pin_token_base64')
  String pinTokenBase64;
  @JsonKey(name: 'code_id')
  String codeId;
  @JsonKey(name: 'code_url')
  String codeUrl;
  @JsonKey(name: 'device_status')
  String deviceStatus;
  @JsonKey(name: 'has_safe')
  bool hasSafe;
  @JsonKey(name: 'has_pin')
  bool hasPin;
  @JsonKey(name: 'has_emergency_contact')
  bool hasEmergencyContact;
  @JsonKey(name: 'receive_message_source')
  String receiveMessageSource;
  @JsonKey(name: 'accept_conversation_source')
  String acceptConversationSource;
  @JsonKey(name: 'accept_search_source')
  String acceptSearchSource;
  @JsonKey(name: 'fiat_currency')
  String fiatCurrency;
  @JsonKey(name: 'transfer_notification_threshold')
  double transferNotificationThreshold;
  @JsonKey(name: 'transfer_confirmation_threshold')
  double transferConfirmationThreshold;

  @JsonKey(name: 'tip_counter')
  int tipCounter;
  @JsonKey(name: 'tip_key_base64')
  String tipKeyBase64;

  @JsonKey(name: 'membership')
  Membership? membership;

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  @override
  List<Object?> get props => [
        userId,
        identityNumber,
        phone,
        fullName,
        biography,
        avatarUrl,
        relationship,
        muteUntil,
        createdAt,
        isVerified,
        isScam,
        sessionId,
        pinToken,
        pinTokenBase64,
        codeId,
        codeUrl,
        deviceStatus,
        hasSafe,
        hasPin,
        hasEmergencyContact,
        receiveMessageSource,
        acceptConversationSource,
        acceptSearchSource,
        fiatCurrency,
        transferConfirmationThreshold,
        tipCounter,
        tipKeyBase64,
        membership
      ];
}
