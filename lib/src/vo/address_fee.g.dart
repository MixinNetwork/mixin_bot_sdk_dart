// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_fee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressFee _$AddressFeeFromJson(Map<String, dynamic> json) => AddressFee(
      destination: json['destination'] as String,
      assetId: json['fee_asset_id'] as String,
      fee: json['fee'] as String,
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$AddressFeeToJson(AddressFee instance) =>
    <String, dynamic>{
      'destination': instance.destination,
      'tag': instance.tag,
      'fee_asset_id': instance.assetId,
      'fee': instance.fee,
    };
