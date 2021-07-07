// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositEntry _$DepositEntryFromJson(Map<String, dynamic> json) {
  return DepositEntry(
    destination: json['destination'] as String,
    tag: json['tag'] as String?,
  );
}

Map<String, dynamic> _$DepositEntryToJson(DepositEntry instance) =>
    <String, dynamic>{
      'destination': instance.destination,
      'tag': instance.tag,
    };
