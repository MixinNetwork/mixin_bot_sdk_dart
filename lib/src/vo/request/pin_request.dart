import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pin_request.g.dart';

@JsonSerializable()
class PinRequest with EquatableMixin {
  PinRequest({
    required this.pin,
    this.oldPin,
  });

  factory PinRequest.fromJson(Map<String, dynamic> json) =>
      _$PinRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PinRequestToJson(this);

  @JsonKey(name: 'pin')
  String pin;
  @JsonKey(name: 'old_pin')
  String? oldPin;

  @override
  List<Object?> get props => [
        pin,
        oldPin,
      ];
}
