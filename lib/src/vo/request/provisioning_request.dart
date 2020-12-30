import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'provisioning_request.g.dart';

@JsonSerializable()
class ProvisioningRequest with EquatableMixin {
  @JsonKey(name: 'user_id')
  String userId;
  @JsonKey(name: 'session_id')
  String sessionId;
  @JsonKey(name: 'session_secret')
  String sessionSecret;
  String code;
  String platform;
  @JsonKey(name: 'platform_version')
  String platformVersion;
  String purpose;
  @JsonKey(name: 'registration_id')
  String registrationId;

  ProvisioningRequest({
    this.userId,
    this.sessionId,
    this.sessionSecret,
    this.code,
    this.platform,
    this.platformVersion,
    this.purpose,
    this.registrationId,
  });

  factory ProvisioningRequest.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProvisioningRequestToJson(this);

  @override
  List<Object> get props => [
    userId,
    sessionId,
    sessionSecret,
    code,
    platform,
    platformVersion,
    purpose,
    registrationId,
  ];
}
