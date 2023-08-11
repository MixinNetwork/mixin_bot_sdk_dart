import 'package:json_annotation/json_annotation.dart';

part 'multisigs_utxo_response.g.dart';

@JsonSerializable()
class MultisigsUTXOResponse {
  MultisigsUTXOResponse({
    required this.type,
    required this.userId,
    required this.utxoId,
    required this.assetId,
    required this.transactionHash,
    required this.outputIndex,
    required this.amount,
    required this.threshold,
    required this.members,
    required this.memo,
    required this.state,
    required this.sender,
    required this.createdAt,
    required this.updatedAt,
    required this.signedBy,
    required this.signedTx,
  });

  factory MultisigsUTXOResponse.fromJson(Map<String, dynamic> json) =>
      _$MultisigsUTXOResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MultisigsUTXOResponseToJson(this);

  final String type;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'utxo_id')
  final String utxoId;
  @JsonKey(name: 'asset_id')
  final String assetId;
  @JsonKey(name: 'transaction_hash')
  final String transactionHash;
  @JsonKey(name: 'output_index')
  final int outputIndex;
  final String amount;
  final int threshold;
  final List<String> members;
  final String memo;
  final String state;
  final String sender;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @JsonKey(name: 'signed_by')
  final String signedBy;
  @JsonKey(name: 'signed_tx')
  final String signedTx;
}
