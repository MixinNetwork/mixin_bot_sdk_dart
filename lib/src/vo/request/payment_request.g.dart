// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentRequest _$PaymentRequestFromJson(Map<String, dynamic> json) =>
    PaymentRequest(
      assetId: json['asset_id'] as String?,
      amount: json['amount'] as String?,
      addressId: json['address_id'] as String?,
      opponentId: json['opponent_id'] as String?,
      opponentKey: json['opponent_key'] as String?,
      opponentMultisig: json['opponent_multisig'] == null
          ? null
          : OpponentMultisig.fromJson(
              json['opponent_multisig'] as Map<String, dynamic>),
      pin: json['pin'] as String?,
      pinBase64: json['pin_base64'] as String?,
      traceId: json['trace_id'] as String?,
      memo: json['memo'] as String?,
    );

Map<String, dynamic> _$PaymentRequestToJson(PaymentRequest instance) =>
    <String, dynamic>{
      'asset_id': instance.assetId,
      'address_id': instance.addressId,
      'opponent_id': instance.opponentId,
      'opponent_key': instance.opponentKey,
      'opponent_multisig': instance.opponentMultisig,
      'amount': instance.amount,
      'pin': instance.pin,
      'pin_base64': instance.pinBase64,
      'trace_id': instance.traceId,
      'memo': instance.memo,
    };
