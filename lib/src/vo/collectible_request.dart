import 'package:json_annotation/json_annotation.dart';

part 'collectible_request.g.dart';

enum CollectibleRequestAction { sign, unlock }

@JsonSerializable()
class CollectibleRequest {
  CollectibleRequest(
    this.type,
    this.requestId,
    this.userId,
    this.tokenId,
    this.amount,
    this.sendersThreshold,
    this.senders,
    this.receiversThreshold,
    this.receivers,
    this.signers,
    this.action,
    this.state,
    this.transactionHash,
    this.rawTransaction,
    this.createdAt,
    this.codeId,
  );

  factory CollectibleRequest.fromJson(Map<String, dynamic> json) =>
      _$CollectibleRequestFromJson(json);

  final String type;

  @JsonKey(name: 'request_id')
  final String requestId;

  @JsonKey(name: 'user_id')
  final String userId;

  @JsonKey(name: 'token_id')
  final String tokenId;

  @JsonKey(name: 'amount')
  final String amount;

  @JsonKey(name: 'senders_threshold')
  final int sendersThreshold;

  @JsonKey(name: 'senders')
  final List<String> senders;

  @JsonKey(name: 'receivers_threshold')
  final int receiversThreshold;

  @JsonKey(name: 'receivers')
  final List<String> receivers;

  @JsonKey(name: 'signers')
  final List<String> signers;

  @JsonKey(name: 'action')
  final CollectibleRequestAction action;

  @JsonKey(name: 'state')
  final String state;

  @JsonKey(name: 'transaction_hash')
  final String transactionHash;

  @JsonKey(name: 'raw_transaction')
  final String rawTransaction;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'code_id')
  final String codeId;

  Map<String, dynamic> toJson() => _$CollectibleRequestToJson(this);
}
