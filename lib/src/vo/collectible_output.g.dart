// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collectible_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectibleOutput _$CollectibleOutputFromJson(Map<String, dynamic> json) =>
    CollectibleOutput(
      json['user_id'] as String,
      json['output_id'] as String,
      json['token_id'] as String,
      json['transaction_hash'] as String,
      (json['output_index'] as num).toInt(),
      json['amount'] as String,
      (json['senders_threshold'] as num).toInt(),
      (json['senders'] as List<dynamic>).map((e) => e as String).toList(),
      (json['receivers_threshold'] as num).toInt(),
      (json['receivers'] as List<dynamic>).map((e) => e as String).toList(),
      json['state'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
      json['signed_by'] as String,
      json['signed_tx'] as String,
    );

Map<String, dynamic> _$CollectibleOutputToJson(CollectibleOutput instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'output_id': instance.outputId,
      'token_id': instance.tokenId,
      'transaction_hash': instance.transactionHash,
      'output_index': instance.outputIndex,
      'amount': instance.amount,
      'senders_threshold': instance.sendersThreshold,
      'senders': instance.senders,
      'receivers_threshold': instance.receiversThreshold,
      'receivers': instance.receivers,
      'state': instance.state,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'signed_by': instance.signedBy,
      'signed_tx': instance.signedTx,
    };
