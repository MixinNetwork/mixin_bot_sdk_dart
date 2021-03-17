import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'circle_name.g.dart';

@JsonSerializable()
class CircleName with EquatableMixin {
  @JsonKey(name: 'name', disallowNullValue: true)
  String name;

  CircleName({
    required this.name,
  });

  factory CircleName.fromJson(Map<String, dynamic> json) =>
      _$CircleNameFromJson(json);

  Map<String, dynamic> toJson() => _$CircleNameToJson(this);

  @override
  List<Object> get props => [
        name,
      ];
}
