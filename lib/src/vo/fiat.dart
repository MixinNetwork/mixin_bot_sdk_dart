import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fiat.g.dart';

@JsonSerializable()
class Fiat with EquatableMixin {
  Fiat({
    required this.code,
    required this.rate,
  });

  factory Fiat.fromJson(Map<String, dynamic> json) => _$FiatFromJson(json);

  Map<String, dynamic> toJson() => _$FiatToJson(this);

  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'rate')
  final double rate;

  @override
  List<Object> get props => [
        code,
        rate,
      ];
}
