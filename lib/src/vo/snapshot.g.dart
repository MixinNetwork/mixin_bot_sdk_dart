// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snapshot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Snapshot _$SnapshotFromJson(Map<String, dynamic> json) => Snapshot(
      json['snapshot_id'] as String,
      json['type'] as String,
      json['asset_id'] as String,
      json['amount'] as String,
      DateTime.parse(json['created_at'] as String),
      json['opponent_id'] as String?,
      json['trace_id'] as String?,
      json['transaction_hash'] as String?,
      json['sender'] as String?,
      json['receiver'] as String?,
      json['memo'] as String?,
      json['confirmations'] as int?,
    )
      ..snapshotHash = json['snapshot_hash'] as String?
      ..snapshotAt = json['snapshot_at'] == null
          ? null
          : DateTime.parse(json['snapshot_at'] as String);

Map<String, dynamic> _$SnapshotToJson(Snapshot instance) => <String, dynamic>{
      'snapshot_id': instance.snapshotId,
      'type': instance.type,
      'asset_id': instance.assetId,
      'amount': instance.amount,
      'created_at': instance.createdAt.toIso8601String(),
      'opponent_id': instance.opponentId,
      'trace_id': instance.traceId,
      'transaction_hash': instance.transactionHash,
      'sender': instance.sender,
      'receiver': instance.receiver,
      'memo': instance.memo,
      'confirmations': instance.confirmations,
      'snapshot_hash': instance.snapshotHash,
      'snapshot_at': instance.snapshotAt?.toIso8601String(),
    };
