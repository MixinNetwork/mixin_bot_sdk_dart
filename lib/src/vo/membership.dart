import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../mixin_bot_sdk_dart.dart';

part 'membership.g.dart';

@JsonEnum(valueField: 'value')
enum Plan {
  none('none'),
  basic('advance'),
  standard('elite'),
  premium('prosperity');

  const Plan(this.value);

  final String value;
}

@JsonSerializable()
class Membership with EquatableMixin, CodeTypeInterface {
  Membership({required this.plan, required this.expiredAt});

  factory Membership.fromJson(Map<String, dynamic> json) =>
      _$MembershipFromJson(json);

  Map<String, dynamic> toJson() => _$MembershipToJson(this);

  @JsonKey(name: 'plan')
  final Plan plan;
  @JsonKey(name: 'expired_at')
  final DateTime expiredAt;

  @override
  List<Object?> get props => [plan, expiredAt];

  bool get isValid =>
      [Plan.basic, Plan.standard, Plan.premium].contains(plan) &&
      DateTime.now().isBefore(expiredAt);
}
