import 'package:json_annotation/json_annotation.dart';

part 'deactivate_request.g.dart';

@JsonSerializable()
class DeactivateRequest {
  DeactivateRequest(this.pin, this.verificationId);

  factory DeactivateRequest.fromJson(Map<String, dynamic> json) =>
      _$DeactivateRequestFromJson(json);

  @JsonKey(name: 'pin_base64')
  final String pin;
  @JsonKey(name: 'verification_id')
  final String verificationId;

  Map<String, dynamic> toJson() => _$DeactivateRequestToJson(this);
}
