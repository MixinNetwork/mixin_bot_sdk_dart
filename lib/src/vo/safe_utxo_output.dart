import 'package:json_annotation/json_annotation.dart';

part 'safe_utxo_output.g.dart';

@JsonSerializable()
class SafeUtxoOutput {
  const SafeUtxoOutput({
    required this.outputId,
    required this.transactionHash,
    required this.outputIndex,
    required this.asset,
    required this.sequence,
    required this.amount,
    required this.mask,
    required this.keys,
    required this.receivers,
    required this.receiversHash,
    required this.receiversThreshold,
    required this.extra,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
    required this.signedBy,
    required this.signedAt,
    required this.spentAt,
  });

  factory SafeUtxoOutput.fromJson(Map<String, dynamic> json) =>
      _$SafeUtxoOutputFromJson(json);

  @JsonKey(name: 'output_id')
  final String outputId;

  @JsonKey(name: 'transaction_hash')
  final String transactionHash;

  @JsonKey(name: 'output_index')
  final int outputIndex;

  @JsonKey(name: 'asset')
  final String asset;

  @JsonKey(name: 'sequence')
  final int sequence;

  @JsonKey(name: 'amount')
  final String amount;

  @JsonKey(name: 'mask')
  final String mask;

  @JsonKey(name: 'keys')
  final List<String> keys;

  @JsonKey(name: 'receivers')
  final List<String> receivers;

  @JsonKey(name: 'receivers_hash')
  final String receiversHash;

  @JsonKey(name: 'receivers_threshold')
  final int receiversThreshold;

  @JsonKey(name: 'extra')
  final String extra;

  @JsonKey(name: 'state')
  final String state;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'signed_by')
  final String signedBy;

  @JsonKey(name: 'signed_at')
  final String signedAt;

  @JsonKey(name: 'spent_at')
  final String spentAt;

  Map<String, dynamic> toJson() => _$SafeUtxoOutputToJson(this);
}

enum OutputState {
  unspent,
  spent,
  signed,
}
