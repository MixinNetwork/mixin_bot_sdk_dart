import 'package:json_annotation/json_annotation.dart';

import 'code_type_interface.dart';

part 'multisigs_response.g.dart';

@JsonSerializable()
class MultisigsResponse implements CodeTypeInterface {
  MultisigsResponse(
    this.type,
    this.codeId,
    this.requestId,
    this.action,
    this.userId,
    this.assetId,
    this.amount,
    this.senders,
    this.receivers,
    this.threshold,
    this.state,
    this.transactionHash,
    this.rawTransaction,
    this.createdAt,
    this.memo,
  );

  factory MultisigsResponse.fromJson(Map<String, dynamic> json) =>
      _$MultisigsResponseFromJson(json);

  final String type;
  @JsonKey(name: 'code_id')
  final String codeId;
  @JsonKey(name: 'request_id')
  final String requestId;

  /// sign | unlock
  final String action;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'asset_id')
  final String assetId;
  final String amount;
  final List<String> senders;
  final List<String> receivers;
  final int threshold;

  /// signed | initial | unlocked
  final String state;
  @JsonKey(name: 'transaction_hash')
  final String transactionHash;
  @JsonKey(name: 'raw_transaction')
  final String rawTransaction;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final String? memo;

  Map<String, dynamic> toJson() => _$MultisigsResponseToJson(this);
}
