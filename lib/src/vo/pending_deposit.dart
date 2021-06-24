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
  String type;
  @JsonKey(name: 'transaction_id')
  String transactionId;
  @JsonKey(name: 'transaction_hash')
  String transactionHash;
  @JsonKey(name: 'sender')
  String sender;
  @JsonKey(name: 'amount')
  String amount;
  @JsonKey(name: 'confirmations')
  int confirmations;
  @JsonKey(name: 'threshold')
  int threshold;
  @JsonKey(name: 'created_at')
  DateTime createdAt;

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
