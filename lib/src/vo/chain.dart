import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chain.g.dart';

@JsonSerializable()
class Chain with EquatableMixin {
  Chain({
    required this.chainId,
    required this.name,
    required this.symbol,
    required this.iconUrl,
    required this.threshold,
  });

  factory Chain.fromJson(Map<String, dynamic> json) => _$ChainFromJson(json);

  Map<String, dynamic> toJson() => _$ChainToJson(this);

  @JsonKey(name: 'chain_id')
  String chainId;
  String name;
  String symbol;
  @JsonKey(name: 'icon_url')
  String iconUrl;
  int threshold;

  @override
  List<Object?> get props => [
        chainId,
        name,
        symbol,
        iconUrl,
        threshold,
      ];
}
