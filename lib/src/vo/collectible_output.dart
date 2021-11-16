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
  String userId;
  @JsonKey(name: 'output_id')
  String outputId;
  @JsonKey(name: 'token_id')
  String tokenId;
  @JsonKey(name: 'transaction_hash')
  String transactionHash;
  @JsonKey(name: 'output_index')
  int outputIndex;
  @JsonKey(name: 'amount')
  String amount;
  @JsonKey(name: 'senders_threshold')
  int sendersThreshold;
  @JsonKey(name: 'senders')
  List<String> senders;
  @JsonKey(name: 'receivers_threshold')
  int receiversThreshold;
  @JsonKey(name: 'receivers')
  List<String> receivers;
  @JsonKey(name: 'state')
  String state;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'updated_at')
  String updatedAt;
  @JsonKey(name: 'signed_by')
  String signedBy;
  @JsonKey(name: 'signed_tx')
  String signedTx;

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
