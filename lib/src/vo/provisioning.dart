import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'provisioning.g.dart';

@JsonSerializable()
class Provisioning with EquatableMixin {
  Provisioning({
    required this.deviceId,
    required this.expiredAt,
    required this.secret,
    required this.platform,
    required this.provisioningCode,
    required this.sessionId,
    required this.userId,
  });

  factory Provisioning.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningFromJson(json);

  Map<String, dynamic> toJson() => _$ProvisioningToJson(this);

  @JsonKey(name: 'device_id')
  String deviceId;
  @JsonKey(name: 'expired_at')
  DateTime? expiredAt;
  String secret;
  String platform;
  @JsonKey(name: 'provisioning_code')
  String provisioningCode;
  @JsonKey(name: 'session_id')
  String sessionId;
  @JsonKey(name: 'user_id')
  String userId;

  @override
  List<Object?> get props => [
        deviceId,
        expiredAt,
        secret,
        platform,
        provisioningCode,
        sessionId,
        userId,
      ];
}
