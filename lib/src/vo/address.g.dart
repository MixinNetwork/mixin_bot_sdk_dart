// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    addressId: json['address_id'] as String,
    type: json['type'] as String,
    assetId: json['asset_id'] as String,
    destination: json['destination'] as String,
    label: json['label'] as String,
    updatedAt: DateTime.parse(json['updated_at'] as String),
    reserve: json['reserve'] as String,
    fee: json['fee'] as String,
    tag: json['tag'] as String?,
    dust: json['dust'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'address_id': instance.addressId,
      'type': instance.type,
      'asset_id': instance.assetId,
      'destination': instance.destination,
      'label': instance.label,
      'updated_at': instance.updatedAt.toIso8601String(),
      'reserve': instance.reserve,
      'fee': instance.fee,
      'tag': instance.tag,
      'dust': instance.dust,
    };
