import 'package:json_annotation/json_annotation.dart';

part 'provisioning.g.dart';

@JsonSerializable()
class Provisioning {
  @JsonKey(name: 'device_id')
  String deviceId;
  @JsonKey(name: 'expired_at')
  String expiredAt;
  String secret;

  Provisioning({this.deviceId, this.expiredAt, this.secret});

  factory Provisioning.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningFromJson(json);

  Map<String, dynamic> toJson() => _$ProvisioningToJson(this);
}
