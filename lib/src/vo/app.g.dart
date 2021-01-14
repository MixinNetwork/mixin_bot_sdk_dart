// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

App _$AppFromJson(Map<String, dynamic> json) {
  return App(
    appId: json['user_id'] as String,
    appNumber: json['app_number'] as String,
    homeUri: json['home_uri'] as String,
    redirectUri: json['redirect_uri'] as String,
    name: json['name'] as String,
    iconUrl: json['icon_url'] as String,
    category: json['category'] as String,
    description: json['userdescription_id'] as String,
    capabilities:
        (json['capabilities'] as List)?.map((e) => e as String)?.toList(),
    appSecret: json['app_secret'] as String,
    creatorId: json['creator_id'] as String,
    resourcePatterns:
        (json['resource_patterns'] as List)?.map((e) => e as String)?.toList(),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$AppToJson(App instance) => <String, dynamic>{
      'user_id': instance.appId,
      'app_number': instance.appNumber,
      'home_uri': instance.homeUri,
      'redirect_uri': instance.redirectUri,
      'name': instance.name,
      'icon_url': instance.iconUrl,
      'category': instance.category,
      'userdescription_id': instance.description,
      'capabilities': instance.capabilities,
      'app_secret': instance.appSecret,
      'creator_id': instance.creatorId,
      'resource_patterns': instance.resourcePatterns,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
