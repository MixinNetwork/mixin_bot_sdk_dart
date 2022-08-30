import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verification_request.g.dart';

@JsonSerializable()
class VerificationRequest extends Equatable {
  const VerificationRequest({
    this.phone,
    this.purpose,
    this.gRecaptchaResponse,
    this.hCaptchaResponse,
    this.packageName,
  });

  factory VerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$VerificationRequestFromJson(json);

  @JsonKey(name: 'phone')
  final String? phone;

  @JsonKey(name: 'purpose')
  final VerificationPurpose? purpose;

  @JsonKey(name: 'g_recaptcha_response')
  final String? gRecaptchaResponse;

  @JsonKey(name: 'g_recaptcha_token')
  final String? hCaptchaResponse;

  @JsonKey(name: 'package_name')
  final String? packageName;

  @override
  List<Object?> get props => [
        phone,
        purpose,
        gRecaptchaResponse,
        hCaptchaResponse,
        packageName,
      ];

  Map<String, dynamic> toJson() => _$VerificationRequestToJson(this);
}

enum VerificationPurpose {
  @JsonValue('SESSION')
  session,
  @JsonValue('PHONE')
  phone,
  @JsonValue('DEACTIVATED')
  deactivated,
}
