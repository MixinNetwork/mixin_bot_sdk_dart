import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deposit_entry.g.dart';

@JsonSerializable()
class DepositEntry with EquatableMixin {
  DepositEntry({
    required this.destination,
    this.tag,
  });

  factory DepositEntry.fromJson(Map<String, dynamic> json) =>
      _$DepositEntryFromJson(json);

  Map<String, dynamic> toJson() => _$DepositEntryToJson(this);

  @JsonKey(name: 'destination')
  String destination;
  @JsonKey(name: 'tag')
  String? tag;

  @override
  List<Object?> get props => [destination, tag];
}
