// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StickerRequest _$StickerRequestFromJson(Map<String, dynamic> json) =>
    StickerRequest(
      dataBase64: json['data_base64'] as String?,
      stickerId: json['sticker_id'] as String?,
    );

Map<String, dynamic> _$StickerRequestToJson(StickerRequest instance) =>
    <String, dynamic>{
      'data_base64': instance.dataBase64,
      'sticker_id': instance.stickerId,
    };
