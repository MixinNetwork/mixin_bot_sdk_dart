import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collectible_output.g.dart';

@JsonSerializable()
class CollectibleOutput with EquatableMixin {
  CollectibleOutput(
    this.userId,
    this.outputId,
    this.tokenId,
    this.transactionHash,
    this.outputIndex,
    this.amount,
    this.sendersThreshold,
    this.senders,
    this.receiversThreshold,
    this.receivers,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.signedBy,
    this.signedTx,
  );

  factory CollectibleOutput.fromJson(Map<String, dynamic> json) =>
      _$CollectibleOutputFromJson(json);

  static const kStateUnspent = 'unspent';
  static const kStateSigned = 'signed';
  static const kStateSpent = 'spent';

  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'output_id')
  final String outputId;
  @JsonKey(name: 'token_id')
  final String tokenId;
  @JsonKey(name: 'transaction_hash')
  final String transactionHash;
  @JsonKey(name: 'output_index')
  final int outputIndex;
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
  @JsonKey(name: 'state')
  final String state;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'signed_by')
  final String signedBy;
  @JsonKey(name: 'signed_tx')
  final String signedTx;

  @override
  List<Object?> get props => [
    userId,
    outputId,
    tokenId,
    transactionHash,
    outputIndex,
    amount,
    sendersThreshold,
    senders,
    receiversThreshold,
    receivers,
    state,
    createdAt,
    updatedAt,
    signedBy,
    signedTx,
  ];

  Map<String, dynamic> toJson() => _$CollectibleOutputToJson(this);
}
