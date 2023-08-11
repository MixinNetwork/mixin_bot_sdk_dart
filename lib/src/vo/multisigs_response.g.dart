// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multisigs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultisigsResponse _$MultisigsResponseFromJson(Map<String, dynamic> json) =>
    MultisigsResponse(
      json['type'] as String,
      json['code_id'] as String,
      json['request_id'] as String,
      json['action'] as String,
      json['user_id'] as String,
      json['asset_id'] as String,
      json['amount'] as String,
      (json['senders'] as List<dynamic>).map((e) => e as String).toList(),
      (json['receivers'] as List<dynamic>).map((e) => e as String).toList(),
      json['threshold'] as int,
      json['state'] as String,
      json['transaction_hash'] as String,
      json['raw_transaction'] as String,
      DateTime.parse(json['created_at'] as String),
      json['memo'] as String?,
    );

Map<String, dynamic> _$MultisigsResponseToJson(MultisigsResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'code_id': instance.codeId,
      'request_id': instance.requestId,
      'action': instance.action,
      'user_id': instance.userId,
      'asset_id': instance.assetId,
      'amount': instance.amount,
      'senders': instance.senders,
      'receivers': instance.receivers,
      'threshold': instance.threshold,
      'state': instance.state,
      'transaction_hash': instance.transactionHash,
      'raw_transaction': instance.rawTransaction,
      'created_at': instance.createdAt.toIso8601String(),
      'memo': instance.memo,
    };
