// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositEntry _$DepositEntryFromJson(Map<String, dynamic> json) => DepositEntry(
      destination: json['destination'] as String,
      tag: json['tag'] as String?,
    )..properties = (json['properties'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList();

Map<String, dynamic> _$DepositEntryToJson(DepositEntry instance) =>
    <String, dynamic>{
      'destination': instance.destination,
      'tag': instance.tag,
      'properties': instance.properties,
    };
