// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PinRequest _$PinRequestFromJson(Map<String, dynamic> json) {
  return PinRequest(
    pin: json['pin'] as String,
    oldPin: json['old_pin'] as String?,
  );
}

Map<String, dynamic> _$PinRequestToJson(PinRequest instance) =>
    <String, dynamic>{
      'pin': instance.pin,
      'old_pin': instance.oldPin,
    };
