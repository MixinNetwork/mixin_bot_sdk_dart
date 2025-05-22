import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pending_deposit.g.dart';

@JsonSerializable()
class PendingDeposit with EquatableMixin {
  PendingDeposit({
    required this.type,
    required this.transactionId,
    required this.transactionHash,
    required this.sender,
    required this.amount,
    required this.confirmations,
    required this.threshold,
    required this.createdAt,
  });

  factory PendingDeposit.fromJson(Map<String, dynamic> json) =>
      _$PendingDepositFromJson(json);

  Map<String, dynamic> toJson() => _$PendingDepositToJson(this);

  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  @JsonKey(name: 'transaction_hash')
  final String transactionHash;
  @JsonKey(name: 'sender')
  final String sender;
  @JsonKey(name: 'amount')
  final String amount;
  @JsonKey(name: 'confirmations')
  final int confirmations;
  @JsonKey(name: 'threshold')
  final int threshold;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  List<Object> get props => [
        type,
        transactionId,
        transactionHash,
        sender,
        amount,
        confirmations,
        threshold,
        createdAt,
      ];
}
