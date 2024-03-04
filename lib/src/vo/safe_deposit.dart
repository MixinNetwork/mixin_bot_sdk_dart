import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'safe_deposit.g.dart';

@JsonSerializable()
class SafeDeposit with EquatableMixin {
  SafeDeposit({
    required this.depositHash,
    required this.sender,
  });

  factory SafeDeposit.fromJson(Map<String, dynamic> json) =>
      _$SafeDepositFromJson(json);

  @JsonKey(name: 'deposit_hash')
  final String depositHash;

  @JsonKey(name: 'sender', defaultValue: '')
  final String sender;

  @override
  List<Object?> get props => [depositHash, sender];

  Map<String, dynamic> toJson() => _$SafeDepositToJson(this);
}
