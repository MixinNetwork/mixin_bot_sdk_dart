import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'circle_response.g.dart';

@JsonSerializable()
class CircleResponse with EquatableMixin {
  CircleResponse({
    required this.circleId,
    required this.name,
    required this.createdAt,
  });

  factory CircleResponse.fromJson(Map<String, dynamic> json) =>
      _$CircleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CircleResponseToJson(this);

  @JsonKey(name: 'circle_id', disallowNullValue: true)
  final String circleId;
  @JsonKey(name: 'name', disallowNullValue: true)
  final String name;
  @JsonKey(name: 'created_at', disallowNullValue: true)
  final DateTime createdAt;

  @override
  List<Object> get props => [
        circleId,
        name,
        createdAt,
      ];
}
