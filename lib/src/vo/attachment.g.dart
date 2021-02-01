// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attchment _$AttchmentFromJson(Map<String, dynamic> json) {
  return Attchment(
    json['attachment_id'] as String,
    uploadUrl: json['upload_url'] as String,
    viewUrl: json['view_url'] as String,
  );
}

Map<String, dynamic> _$AttchmentToJson(Attchment instance) => <String, dynamic>{
      'attachment_id': instance.attachmentId,
      'upload_url': instance.uploadUrl,
      'view_url': instance.viewUrl,
    };
