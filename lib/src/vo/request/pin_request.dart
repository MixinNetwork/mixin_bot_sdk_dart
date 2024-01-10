import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pin_request.g.dart';

@JsonSerializable()
class PinRequest with EquatableMixin {
  PinRequest({
    required this.pin,
    this.oldPin,
    this.timestamp,
  });

  factory PinRequest.fromJson(Map<String, dynamic> json) =>
      _$PinRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PinRequestToJson(this);

  @JsonKey(name: 'pin')
  final String pin;
  @JsonKey(name: 'old_pin')
  final String? oldPin;
  @JsonKey(name: 'timestamp')
  final int? timestamp;

  @override
  List<Object?> get props => [
        pin,
        oldPin,
        timestamp,
      ];
}
