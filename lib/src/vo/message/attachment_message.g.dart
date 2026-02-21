// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachmentMessage _$AttachmentMessageFromJson(Map<String, dynamic> json) =>
    AttachmentMessage(
      json['key'],
      json['digest'],
      json['attachment_id'] as String,
      json['mime_type'] as String,
      const JsonStringToInt().fromJson(json['size']),
      json['name'] as String?,
      const JsonStringToInt().fromJson(json['width']),
      const JsonStringToInt().fromJson(json['height']),
      json['thumbnail'] as String?,
      const JsonStringToInt().fromJson(json['duration']),
      json['waveform'],
      json['caption'] as String?,
      json['created_at'] as String?,
    )..shareable = json['shareable'] as bool?;

Map<String, dynamic> _$AttachmentMessageToJson(AttachmentMessage instance) =>
    <String, dynamic>{
      'key': dynamicToJson(instance.key),
      'digest': dynamicToJson(instance.digest),
      'attachment_id': instance.attachmentId,
      'mime_type': instance.mimeType,
      'size': const JsonStringToInt().toJson(instance.size),
      'name': instance.name,
      'width': _$JsonConverterToJson<dynamic, int>(
        instance.width,
        const JsonStringToInt().toJson,
      ),
      'height': _$JsonConverterToJson<dynamic, int>(
        instance.height,
        const JsonStringToInt().toJson,
      ),
      'thumbnail': instance.thumbnail,
      'duration': _$JsonConverterToJson<dynamic, int>(
        instance.duration,
        const JsonStringToInt().toJson,
      ),
      'waveform': dynamicToJson(instance.waveform),
      'caption': instance.caption,
      'created_at': instance.createdAt,
      'shareable': instance.shareable,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
