import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../mixin_bot_sdk_dart.dart';

part 'membership.g.dart';

enum Plan {
  none,
  basic,
  standard,
  premium;
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

  bool isMembership() =>
      [Plan.basic, Plan.standard, Plan.premium].contains(plan) &&
      DateTime.now().isBefore(expiredAt);
}
