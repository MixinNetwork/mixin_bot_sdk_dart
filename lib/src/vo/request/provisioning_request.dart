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
  final String userId;
  @JsonKey(name: 'session_id')
  final String sessionId;
  @JsonKey(name: 'session_secret')
  final String sessionSecret;
  final String code;
  final String platform;
  @JsonKey(name: 'platform_version')
  final  String platformVersion;
  @JsonKey(name: 'app_version')
  final String appVersion;
  final String purpose;
  @JsonKey(name: 'registration_id')
  final int registrationId;

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
