import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'safe_pending_deposit.g.dart';

@JsonSerializable()
class SafePendingDeposit with EquatableMixin {
  SafePendingDeposit({
    required this.depositId,
    required this.assetId,
    required this.destination,
    required this.tag,
    required this.transactionHash,
    required this.amount,
    required this.confirmations,
    required this.createdAt,
  });

  factory SafePendingDeposit.fromJson(Map<String, dynamic> json) =>
      _$SafePendingDepositFromJson(json);

  Map<String, dynamic> toJson() => _$SafePendingDepositToJson(this);

  @JsonKey(name: 'deposit_id')
  final String depositId;
  @JsonKey(name: 'asset_id')
  final String assetId;
  final String destination;
  final String? tag;
  @JsonKey(name: 'transaction_hash')
  final String transactionHash;
  final String amount;
  int confirmations;
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  List<Object?> get props => [
        depositId,
        assetId,
        destination,
        tag,
        transactionHash,
        amount,
        confirmations,
        createdAt,
      ];
}
