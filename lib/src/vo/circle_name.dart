import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'circle_name.g.dart';

@JsonSerializable()
class CircleName with EquatableMixin {
  CircleName({
    required this.name,
  });

  factory CircleName.fromJson(Map<String, dynamic> json) =>
      _$CircleNameFromJson(json);

  Map<String, dynamic> toJson() => _$CircleNameToJson(this);

  @JsonKey(name: 'name', disallowNullValue: true)
  String name;

  @override
  List<Object> get props => [
        name,
      ];
}
