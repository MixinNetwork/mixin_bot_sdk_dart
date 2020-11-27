// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signal_key_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignalKeyCount _$SignalKeyCountFromJson(Map<String, dynamic> json) {
  return SignalKeyCount()..preKeyCount = json['one_time_pre_keys_count'] as int;
}

Map<String, dynamic> _$SignalKeyCountToJson(SignalKeyCount instance) =>
    <String, dynamic>{
      'one_time_pre_keys_count': instance.preKeyCount,
    };
