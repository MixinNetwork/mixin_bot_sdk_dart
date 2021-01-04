import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account with EquatableMixin {
  @JsonKey(name: 'user_id')
  String userId;
  @JsonKey(name: 'identity_number')
  String identityNumber;
  @JsonKey(name: 'phone')
  String phone;
  @JsonKey(name: 'full_name')
  String fullName;
  @JsonKey(name: 'biography')
  String biography;
  @JsonKey(name: 'avatar_url')
  String avatarUrl;
  @JsonKey(name: 'relationship')
  String relationship;
  @JsonKey(name: 'mute_until')
  String muteUntil;
  @JsonKey(name: 'created_at')
  String createdAt;
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
  int transferNotificationThreshold;
  @JsonKey(name: 'transfer_confirmation_threshold')
  int transferConfirmationThreshold;

  Account(
      {this.userId,
      this.identityNumber,
      this.phone,
      this.fullName,
      this.biography,
      this.avatarUrl,
      this.relationship,
      this.muteUntil,
      this.createdAt,
      this.isVerified,
      this.isScam,
      this.sessionId,
      this.pinToken,
      this.pinTokenBase64,
      this.codeId,
      this.codeUrl,
      this.deviceStatus,
      this.hasPin,
      this.hasEmergencyContact,
      this.receiveMessageSource,
      this.acceptConversationSource,
      this.acceptSearchSource,
      this.fiatCurrency,
      this.transferNotificationThreshold,
      this.transferConfirmationThreshold});

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  @override
  List<Object> get props => [
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
        hasPin,
        hasEmergencyContact,
        receiveMessageSource,
        acceptConversationSource,
        acceptSearchSource,
        fiatCurrency,
        transferConfirmationThreshold,
      ];
}
