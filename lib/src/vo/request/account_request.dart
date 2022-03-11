import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_request.g.dart';

@JsonSerializable()
class AccountRequest extends Equatable {
  const AccountRequest({
    required this.platform,
    required this.platformVersion,
    required this.appVersion,
    required this.packageName,
    required this.purpose,
    this.code,
    this.notificationToken,
    this.registrationId,
    this.pin,
    this.sessionSecret,
  });

  factory AccountRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountRequestFromJson(json);

  @JsonKey(name: 'code')
  final String? code;
  @JsonKey(name: 'notification_token')
  final String? notificationToken;
  @JsonKey(name: 'registration_id')
  final int? registrationId;
  @JsonKey(name: 'platform')
  final String platform;
  @JsonKey(name: 'platform_version')
  final String platformVersion;
  @JsonKey(name: 'app_version')
  final String appVersion;
  @JsonKey(name: 'package_name')
  final String packageName;
  @JsonKey(name: 'purpose')
  final String purpose;
  @JsonKey(name: 'pin')
  final String? pin;
  @JsonKey(name: 'session_secret')
  final String? sessionSecret;

  @override
  List<Object?> get props => [
        code,
        notificationToken,
        registrationId,
        platform,
        platformVersion,
        appVersion,
        packageName,
        purpose,
        pin,
        sessionSecret,
      ];

  Map<String, dynamic> toJson() => _$AccountRequestToJson(this);
}
