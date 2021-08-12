// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fiat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fiat _$FiatFromJson(Map<String, dynamic> json) => Fiat(
      code: json['code'] as String,
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$FiatToJson(Fiat instance) => <String, dynamic>{
      'code': instance.code,
      'rate': instance.rate,
    };
