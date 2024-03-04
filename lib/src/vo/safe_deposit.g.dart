// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'safe_deposit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SafeDeposit _$SafeDepositFromJson(Map<String, dynamic> json) => SafeDeposit(
      depositHash: json['deposit_hash'] as String,
      sender: json['sender'] as String? ?? '',
    );

Map<String, dynamic> _$SafeDepositToJson(SafeDeposit instance) =>
    <String, dynamic>{
      'deposit_hash': instance.depositHash,
      'sender': instance.sender,
    };
