// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collectible_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectibleRequest _$CollectibleRequestFromJson(Map<String, dynamic> json) =>
    CollectibleRequest(
      json['type'] as String,
      json['request_id'] as String,
      json['user_id'] as String,
      json['token_id'] as String,
      json['amount'] as String,
      (json['senders_threshold'] as num).toInt(),
      (json['senders'] as List<dynamic>).map((e) => e as String).toList(),
      (json['receivers_threshold'] as num).toInt(),
      (json['receivers'] as List<dynamic>).map((e) => e as String).toList(),
      (json['signers'] as List<dynamic>).map((e) => e as String).toList(),
      $enumDecode(_$CollectibleRequestActionEnumMap, json['action']),
      json['state'] as String,
      json['transaction_hash'] as String,
      json['raw_transaction'] as String,
      DateTime.parse(json['created_at'] as String),
      json['code_id'] as String,
    );

Map<String, dynamic> _$CollectibleRequestToJson(CollectibleRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'request_id': instance.requestId,
      'user_id': instance.userId,
      'token_id': instance.tokenId,
      'amount': instance.amount,
      'senders_threshold': instance.sendersThreshold,
      'senders': instance.senders,
      'receivers_threshold': instance.receiversThreshold,
      'receivers': instance.receivers,
      'signers': instance.signers,
      'action': _$CollectibleRequestActionEnumMap[instance.action]!,
      'state': instance.state,
      'transaction_hash': instance.transactionHash,
      'raw_transaction': instance.rawTransaction,
      'created_at': instance.createdAt.toIso8601String(),
      'code_id': instance.codeId,
    };

const _$CollectibleRequestActionEnumMap = {
  CollectibleRequestAction.sign: 'sign',
  CollectibleRequestAction.unlock: 'unlock',
};
