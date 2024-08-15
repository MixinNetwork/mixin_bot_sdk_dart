// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Membership _$MembershipFromJson(Map<String, dynamic> json) => Membership(
      plan: $enumDecode(_$PlanEnumMap, json['plan']),
      expiredAt: DateTime.parse(json['expired_at'] as String),
    );

Map<String, dynamic> _$MembershipToJson(Membership instance) =>
    <String, dynamic>{
      'plan': _$PlanEnumMap[instance.plan]!,
      'expired_at': instance.expiredAt.toIso8601String(),
    };

const _$PlanEnumMap = {
  Plan.none: 'none',
  Plan.basic: 'advance',
  Plan.standard: 'elite',
  Plan.premium: 'prosperity',
};
