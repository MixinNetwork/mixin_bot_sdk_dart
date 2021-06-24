import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticker.g.dart';

@JsonSerializable()
class Ticker with EquatableMixin {
  Ticker({
    required this.priceUsd,
    required this.priceBtc,
  });

  factory Ticker.fromJson(Map<String, dynamic> json) => _$TickerFromJson(json);

  Map<String, dynamic> toJson() => _$TickerToJson(this);

  @JsonKey(name: 'price_usd')
  String priceUsd;
  @JsonKey(name: 'price_btc')
  String priceBtc;

  @override
  List<Object> get props => [priceUsd, priceBtc];
}
