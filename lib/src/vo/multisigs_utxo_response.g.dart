// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multisigs_utxo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultisigsUTXOResponse _$MultisigsUTXOResponseFromJson(
        Map<String, dynamic> json) =>
    MultisigsUTXOResponse(
      type: json['type'] as String,
      userId: json['user_id'] as String,
      utxoId: json['utxo_id'] as String,
      assetId: json['asset_id'] as String,
      transactionHash: json['transaction_hash'] as String,
      outputIndex: json['output_index'] as int,
      amount: json['amount'] as String,
      threshold: json['threshold'] as int,
      members:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
      memo: json['memo'] as String,
      state: json['state'] as String,
      sender: json['sender'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      signedBy: json['signed_by'] as String,
      signedTx: json['signed_tx'] as String,
    );

Map<String, dynamic> _$MultisigsUTXOResponseToJson(
        MultisigsUTXOResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'user_id': instance.userId,
      'utxo_id': instance.utxoId,
      'asset_id': instance.assetId,
      'transaction_hash': instance.transactionHash,
      'output_index': instance.outputIndex,
      'amount': instance.amount,
      'threshold': instance.threshold,
      'members': instance.members,
      'memo': instance.memo,
      'state': instance.state,
      'sender': instance.sender,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'signed_by': instance.signedBy,
      'signed_tx': instance.signedTx,
    };
