// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogResponse _$LogResponseFromJson(Map<String, dynamic> json) => LogResponse(
  type: json['type'] as String,
  logId: json['log_id'] as String,
  code: json['code'] as String,
  ipAddress: json['ip_address'] as String,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$LogResponseToJson(LogResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'log_id': instance.logId,
      'code': instance.code,
      'ip_address': instance.ipAddress,
      'created_at': instance.createdAt,
    };
