// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StickerRequest _$StickerRequestFromJson(Map<String, dynamic> json) =>
    StickerRequest(
      dataBase64: json['dataBase64'] as String?,
      stickerId: json['stickerId'] as String?,
    );

Map<String, dynamic> _$StickerRequestToJson(StickerRequest instance) =>
    <String, dynamic>{
      'dataBase64': instance.dataBase64,
      'stickerId': instance.stickerId,
    };
