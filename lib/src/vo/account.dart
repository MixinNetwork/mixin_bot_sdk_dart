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
    this.membership,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'identity_number')
  final String identityNumber;
  @JsonKey(name: 'phone')
  final String phone;
  @JsonKey(name: 'full_name')
  final String? fullName;
  @JsonKey(name: 'biography')
  final String biography;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @JsonKey(name: 'relationship')
  final UserRelationship? relationship;
  @JsonKey(name: 'mute_until')
  final String muteUntil;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'is_verified')
  final bool isVerified;
  @JsonKey(name: 'is_scam')
  final bool isScam;
  @JsonKey(name: 'session_id')
  final String sessionId;
  @JsonKey(name: 'pin_token')
  final String pinToken;
  @JsonKey(name: 'pin_token_base64')
  final String pinTokenBase64;
  @JsonKey(name: 'code_id')
  final String codeId;
  @JsonKey(name: 'code_url')
  final String codeUrl;
  @JsonKey(name: 'device_status')
  final String deviceStatus;
  @JsonKey(name: 'has_safe')
  final bool hasSafe;
  @JsonKey(name: 'has_pin')
  final bool hasPin;
  @JsonKey(name: 'has_emergency_contact')
  final bool hasEmergencyContact;
  @JsonKey(name: 'receive_message_source')
  final String receiveMessageSource;
  @JsonKey(name: 'accept_conversation_source')
  final String acceptConversationSource;
  @JsonKey(name: 'accept_search_source')
  final String acceptSearchSource;
  @JsonKey(name: 'fiat_currency')
  final String fiatCurrency;
  @JsonKey(name: 'transfer_notification_threshold')
  final double transferNotificationThreshold;
  @JsonKey(name: 'transfer_confirmation_threshold')
  final double transferConfirmationThreshold;

  @JsonKey(name: 'tip_counter')
  final int tipCounter;
  @JsonKey(name: 'tip_key_base64')
  final String tipKeyBase64;

  @JsonKey(name: 'membership')
  final Membership? membership;

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
