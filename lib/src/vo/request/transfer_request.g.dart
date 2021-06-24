// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferRequest _$TransferRequestFromJson(Map<String, dynamic> json) {
  return TransferRequest(
    assetId: json['asset_id'] as String,
    amount: json['amount'] as String,
    opponentId: json['opponent_id'] as String?,
    pin: json['pin'] as String?,
    traceId: json['trace_id'] as String?,
    memo: json['memo'] as String?,
    addressId: json['address_id'] as String?,
  );
}

Map<String, dynamic> _$TransferRequestToJson(TransferRequest instance) =>
    <String, dynamic>{
      'asset_id': instance.assetId,
      'opponent_id': instance.opponentId,
      'amount': instance.amount,
      'pin': instance.pin,
      'trace_id': instance.traceId,
      'memo': instance.memo,
      'address_id': instance.addressId,
    };
