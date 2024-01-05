// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'safe_pending_deposit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SafePendingDeposit _$SafePendingDepositFromJson(Map<String, dynamic> json) =>
    SafePendingDeposit(
      depositId: json['deposit_id'] as String,
      assetId: json['asset_id'] as String,
      destination: json['destination'] as String,
      tag: json['tag'] as String?,
      transactionHash: json['transaction_hash'] as String,
      amount: json['amount'] as String,
      confirmations: json['confirmations'] as int,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$SafePendingDepositToJson(SafePendingDeposit instance) =>
    <String, dynamic>{
      'deposit_id': instance.depositId,
      'asset_id': instance.assetId,
      'destination': instance.destination,
      'tag': instance.tag,
      'transaction_hash': instance.transactionHash,
      'amount': instance.amount,
      'confirmations': instance.confirmations,
      'created_at': instance.createdAt,
    };
