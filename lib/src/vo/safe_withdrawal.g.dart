// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'safe_withdrawal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SafeWithdrawal _$SafeWithdrawalFromJson(Map<String, dynamic> json) =>
    SafeWithdrawal(
      withdrawalHash: json['withdrawal_hash'] as String,
      receiver: json['receiver'] as String,
    );

Map<String, dynamic> _$SafeWithdrawalToJson(SafeWithdrawal instance) =>
    <String, dynamic>{
      'withdrawal_hash': instance.withdrawalHash,
      'receiver': instance.receiver,
    };
