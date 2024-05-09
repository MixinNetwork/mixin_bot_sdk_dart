// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'safe_deposit_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SafeDepositEntry _$SafeDepositEntryFromJson(Map<String, dynamic> json) =>
    SafeDepositEntry(
      entryId: json['entry_id'] as String,
      chainId: json['chain_id'] as String,
      destination: json['destination'] as String,
      members:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
      tag: json['tag'] as String?,
      signature: json['signature'] as String,
      threshold: (json['threshold'] as num).toInt(),
      isPrimary: json['is_primary'] as bool,
    );

Map<String, dynamic> _$SafeDepositEntryToJson(SafeDepositEntry instance) =>
    <String, dynamic>{
      'entry_id': instance.entryId,
      'chain_id': instance.chainId,
      'destination': instance.destination,
      'members': instance.members,
      'tag': instance.tag,
      'signature': instance.signature,
      'threshold': instance.threshold,
      'is_primary': instance.isPrimary,
    };
