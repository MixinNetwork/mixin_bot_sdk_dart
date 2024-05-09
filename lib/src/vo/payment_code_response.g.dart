// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentCodeResponse _$PaymentCodeResponseFromJson(Map<String, dynamic> json) =>
    PaymentCodeResponse(
      json['code_id'] as String,
      json['asset_id'] as String,
      json['amount'] as String,
      (json['receivers'] as List<dynamic>).map((e) => e as String).toList(),
      (json['threshold'] as num).toInt(),
      json['status'] as String,
      json['memo'] as String,
      json['trace_id'] as String,
      json['created_at'] as String,
    );

Map<String, dynamic> _$PaymentCodeResponseToJson(
        PaymentCodeResponse instance) =>
    <String, dynamic>{
      'code_id': instance.codeId,
      'asset_id': instance.assetId,
      'amount': instance.amount,
      'receivers': instance.receivers,
      'threshold': instance.threshold,
      'status': instance.status,
      'memo': instance.memo,
      'trace_id': instance.traceId,
      'created_at': instance.createdAt,
    };
