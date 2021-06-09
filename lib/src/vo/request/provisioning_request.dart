import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'provisioning_request.g.dart';

@JsonSerializable()
class ProvisioningRequest with EquatableMixin {

  ProvisioningRequest({
    required this.userId,
    required this.sessionId,
    required this.sessionSecret,
    required this.code,
    required this.platform,
    required this.platformVersion,
    required this.appVersion,
    required this.purpose,
    required this.registrationId,
  });

  factory ProvisioningRequest.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProvisioningRequestToJson(this);

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
  @JsonKey(name: 'app_version')
  String appVersion;
  String purpose;
  @JsonKey(name: 'registration_id')
  int registrationId;

  @override
  List<Object> get props => [
        userId,
        sessionId,
        sessionSecret,
        code,
        platform,
        platformVersion,
        appVersion,
        purpose,
        registrationId,
      ];
}
