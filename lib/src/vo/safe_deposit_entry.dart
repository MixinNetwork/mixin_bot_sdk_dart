import 'package:json_annotation/json_annotation.dart';

part 'safe_deposit_entry.g.dart';

@JsonSerializable()
class SafeDepositEntry {
  const SafeDepositEntry({
    required this.entryId,
    required this.chainId,
    required this.destination,
    required this.members,
    required this.tag,
    required this.signature,
    required this.threshold,
    required this.isPrimary,
  });

  factory SafeDepositEntry.fromJson(Map<String, dynamic> json) =>
      _$SafeDepositEntryFromJson(json);

  Map<String, dynamic> toJson() => _$SafeDepositEntryToJson(this);

  @JsonKey(name: 'entry_id')
  final String entryId;

  @JsonKey(name: 'chain_id')
  final String chainId;

  @JsonKey(name: 'destination')
  final String destination;

  @JsonKey(name: 'members')
  final List<String> members;

  @JsonKey(name: 'tag')
  final String? tag;

  @JsonKey(name: 'signature')
  final String signature;

  @JsonKey(name: 'threshold')
  final int threshold;

  @JsonKey(name: 'is_primary')
  final bool isPrimary;
}
