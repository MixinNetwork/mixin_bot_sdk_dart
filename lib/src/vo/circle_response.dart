import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'circle_response.g.dart';

@JsonSerializable()
class CircleResponse with EquatableMixin {
  @JsonKey(name: 'circle_id', disallowNullValue: true)
  String circleId;
  @JsonKey(name: 'name', disallowNullValue: true)
  String name;
  @JsonKey(name: 'created_at', disallowNullValue: true)
  DateTime createdAt;

  CircleResponse({
    required this.circleId,
    required this.name,
    required this.createdAt,
  });

  factory CircleResponse.fromJson(Map<String, dynamic> json) =>
      _$CircleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CircleResponseToJson(this);

  @override
  List<Object> get props => [
        circleId,
        name,
        createdAt,
      ];
}
