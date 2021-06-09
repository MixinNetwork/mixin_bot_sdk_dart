// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountUpdateRequest _$AccountUpdateRequestFromJson(Map<String, dynamic> json) {
  return AccountUpdateRequest(
    fullName: json['full_name'] as String?,
    avatarBase64: json['avatar_base64'] as String?,
    receiveMessageSource: json['receive_message_source'] as String?,
    acceptConversationSource: json['accept_conversation_source'] as String?,
    acceptSearchSource: json['accept_search_source'] as String?,
    biography: json['biography'] as String?,
    fiatCurrency: json['fiat_currency'] as String?,
    transferNotificationThreshold:
        (json['transfer_notification_threshold'] as num?)?.toDouble(),
    transferConfirmationThreshold:
        (json['transfer_confirmation_threshold'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$AccountUpdateRequestToJson(
        AccountUpdateRequest instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'avatar_base64': instance.avatarBase64,
      'receive_message_source': instance.receiveMessageSource,
      'accept_conversation_source': instance.acceptConversationSource,
      'accept_search_source': instance.acceptSearchSource,
      'biography': instance.biography,
      'fiat_currency': instance.fiatCurrency,
      'transfer_notification_threshold': instance.transferNotificationThreshold,
      'transfer_confirmation_threshold': instance.transferConfirmationThreshold,
    };
