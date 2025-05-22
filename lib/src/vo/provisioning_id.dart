import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'provisioning_id.g.dart';

@JsonSerializable()
class ProvisioningId with EquatableMixin {
  ProvisioningId({
    required this.deviceId,
    required this.expiredAt,
  });

  factory ProvisioningId.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningIdFromJson(json);

  Map<String, dynamic> toJson() => _$ProvisioningIdToJson(this);

  @JsonKey(name: 'device_id')
  final String deviceId;
  @JsonKey(name: 'expired_at')
  final DateTime? expiredAt;

  @override
  List<Object?> get props => [
        deviceId,
        expiredAt,
      ];
}
