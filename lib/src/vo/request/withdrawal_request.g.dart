// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawalRequest _$WithdrawalRequestFromJson(Map<String, dynamic> json) =>
    WithdrawalRequest(
      amount: json['amount'] as String,
      pin: json['pin'] as String,
      traceId: json['trace_id'] as String,
      addressId: json['address_id'] as String?,
      memo: json['memo'] as String?,
      fee: json['fee'] as String?,
      assetId: json['asset_id'] as String?,
      destination: json['destination'] as String?,
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$WithdrawalRequestToJson(WithdrawalRequest instance) =>
    <String, dynamic>{
      'address_id': instance.addressId,
      'amount': instance.amount,
      'pin': instance.pin,
      'trace_id': instance.traceId,
      'memo': instance.memo,
      'fee': instance.fee,
      'asset_id': instance.assetId,
      'destination': instance.destination,
      'tag': instance.tag,
    };
