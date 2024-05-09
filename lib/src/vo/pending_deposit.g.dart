// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_deposit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingDeposit _$PendingDepositFromJson(Map<String, dynamic> json) =>
    PendingDeposit(
      type: json['type'] as String,
      transactionId: json['transaction_id'] as String,
      transactionHash: json['transaction_hash'] as String,
      sender: json['sender'] as String,
      amount: json['amount'] as String,
      confirmations: (json['confirmations'] as num).toInt(),
      threshold: (json['threshold'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$PendingDepositToJson(PendingDeposit instance) =>
    <String, dynamic>{
      'type': instance.type,
      'transaction_id': instance.transactionId,
      'transaction_hash': instance.transactionHash,
      'sender': instance.sender,
      'amount': instance.amount,
      'confirmations': instance.confirmations,
      'threshold': instance.threshold,
      'created_at': instance.createdAt.toIso8601String(),
    };
