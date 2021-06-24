// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressRequest _$AddressRequestFromJson(Map<String, dynamic> json) {
  return AddressRequest(
    assetId: json['asset_id'] as String,
    pin: json['pin'] as String,
    destination: json['destination'] as String?,
    tag: json['tag'] as String?,
    label: json['label'] as String?,
  );
}

Map<String, dynamic> _$AddressRequestToJson(AddressRequest instance) =>
    <String, dynamic>{
      'asset_id': instance.assetId,
      'destination': instance.destination,
      'tag': instance.tag,
      'label': instance.label,
      'pin': instance.pin,
    };
