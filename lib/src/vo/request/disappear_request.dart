import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'disappear_request.g.dart';

@JsonSerializable()
class DisappearRequest with EquatableMixin {
  const DisappearRequest({required this.duration});

  factory DisappearRequest.fromJson(Map<String, dynamic> json) =>
      _$DisappearRequestFromJson(json);

  @JsonKey(name: 'duration')
  final int duration;

  Map<String, dynamic> toJson() => _$DisappearRequestToJson(this);

  @override
  List<Object?> get props => [duration];
}
