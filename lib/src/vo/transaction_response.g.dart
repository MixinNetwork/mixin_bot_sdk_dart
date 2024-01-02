// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionResponse _$TransactionResponseFromJson(Map<String, dynamic> json) =>
    TransactionResponse(
      type: json['type'] as String,
      requestId: json['request_id'] as String,
      userId: json['user_id'] as String,
      amount: json['amount'] as String,
      transactionHash: json['transaction_hash'] as String,
      snapshotId: json['snapshot_id'] as String?,
      asset: json['asset'] as String,
      sendersHash: json['senders_hash'] as String,
      sendersThreshold: json['senders_threshold'] as int,
      senders:
          (json['senders'] as List<dynamic>).map((e) => e as String).toList(),
      signers:
          (json['signers'] as List<dynamic>).map((e) => e as String).toList(),
      extra: json['extra'] as String,
      state: json['state'] as String,
      rawTransaction: json['raw_transaction'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      snapshotHash: json['snapshot_hash'] as String,
      snapshotAt: json['snapshot_at'] as String,
      views: (json['views'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TransactionResponseToJson(
        TransactionResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'request_id': instance.requestId,
      'user_id': instance.userId,
      'amount': instance.amount,
      'transaction_hash': instance.transactionHash,
      'snapshot_id': instance.snapshotId,
      'asset': instance.asset,
      'senders_hash': instance.sendersHash,
      'senders_threshold': instance.sendersThreshold,
      'senders': instance.senders,
      'signers': instance.signers,
      'extra': instance.extra,
      'state': instance.state,
      'raw_transaction': instance.rawTransaction,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'snapshot_hash': instance.snapshotHash,
      'snapshot_at': instance.snapshotAt,
      'views': instance.views,
    };
