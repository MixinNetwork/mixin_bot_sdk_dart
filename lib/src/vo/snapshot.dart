import 'package:json_annotation/json_annotation.dart';

part 'snapshot.g.dart';

@JsonSerializable()
class Snapshot {
  Snapshot(
      this.snapshotId,
      this.type,
      this.assetId,
      this.amount,
      this.createdAt,
      this.opponentId,
      this.traceId,
      this.transactionHash,
      this.sender,
      this.receiver,
      this.memo,
      this.confirmations);

  factory Snapshot.fromJson(Map<String, dynamic> json) =>
      _$SnapshotFromJson(json);

  @JsonKey(name: 'snapshot_id')
  String snapshotId;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'asset_id')
  String assetId;
  @JsonKey(name: 'amount')
  String amount;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  @JsonKey(name: 'opponent_id')
  String opponentId;
  @JsonKey(name: 'trace_id')
  String traceId;
  @JsonKey(name: 'transaction_hash')
  String? transactionHash;
  @JsonKey(name: 'sender')
  String sender;
  @JsonKey(name: 'receiver')
  String receiver;
  @JsonKey(name: 'memo')
  String memo;
  @JsonKey(name: 'confirmations')
  int confirmations;

  Map<String, dynamic> toJson() => _$SnapshotToJson(this);
}
