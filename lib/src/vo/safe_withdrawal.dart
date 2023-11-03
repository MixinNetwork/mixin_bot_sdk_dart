import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'safe_withdrawal.g.dart';

@JsonSerializable()
class SafeWithdrawal with EquatableMixin {
  const SafeWithdrawal({
    required this.withdrawalHash,
    required this.receiver,
  });

  factory SafeWithdrawal.fromJson(Map<String, dynamic> json) =>
      _$SafeWithdrawalFromJson(json);

  @JsonKey(name: 'withdrawal_hash')
  final String withdrawalHash;

  @JsonKey(name: 'receiver')
  final String receiver;

  @override
  List<Object?> get props => [withdrawalHash, receiver];

  Map<String, dynamic> toJson() => _$SafeWithdrawalToJson(this);
}
