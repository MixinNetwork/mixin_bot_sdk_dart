// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveMessage _$LiveMessageFromJson(Map<String, dynamic> json) => LiveMessage(
  const JsonStringToInt().fromJson(json['width']),
  const JsonStringToInt().fromJson(json['height']),
  json['thumb_url'] as String,
  json['url'] as String,
  json['shareable'] as bool? ?? true,
);

Map<String, dynamic> _$LiveMessageToJson(LiveMessage instance) =>
    <String, dynamic>{
      'width': const JsonStringToInt().toJson(instance.width),
      'height': const JsonStringToInt().toJson(instance.height),
      'thumb_url': instance.thumbUrl,
      'url': instance.url,
      'shareable': instance.shareable,
    };
