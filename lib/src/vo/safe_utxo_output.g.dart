// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'safe_utxo_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SafeUtxoOutput _$SafeUtxoOutputFromJson(Map<String, dynamic> json) =>
    SafeUtxoOutput(
      outputId: json['output_id'] as String,
      transactionHash: json['transaction_hash'] as String,
      outputIndex: json['output_index'] as int,
      asset: json['asset'] as String,
      sequence: json['sequence'] as int,
      amount: json['amount'] as String,
      mask: json['mask'] as String,
      keys: (json['keys'] as List<dynamic>).map((e) => e as String).toList(),
      receivers:
          (json['receivers'] as List<dynamic>).map((e) => e as String).toList(),
      receiversHash: json['receivers_hash'] as String,
      receiversThreshold: json['receivers_threshold'] as int,
      extra: json['extra'] as String,
      state: json['state'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      signedBy: json['signed_by'] as String,
      signedAt: json['signed_at'] as String,
      spentAt: json['spent_at'] as String,
    );

Map<String, dynamic> _$SafeUtxoOutputToJson(SafeUtxoOutput instance) =>
    <String, dynamic>{
      'output_id': instance.outputId,
      'transaction_hash': instance.transactionHash,
      'output_index': instance.outputIndex,
      'asset': instance.asset,
      'sequence': instance.sequence,
      'amount': instance.amount,
      'mask': instance.mask,
      'keys': instance.keys,
      'receivers': instance.receivers,
      'receivers_hash': instance.receiversHash,
      'receivers_threshold': instance.receiversThreshold,
      'extra': instance.extra,
      'state': instance.state,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'signed_by': instance.signedBy,
      'signed_at': instance.signedAt,
      'spent_at': instance.spentAt,
    };
