import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import './app.dart';
import 'code_type_interface.dart';
import 'membership.dart';
import 'user_relationship.dart';

part 'user.g.dart';

@JsonSerializable()
@UserRelationshipJsonConverter()
class User with EquatableMixin, CodeTypeInterface {
  User({
    required this.userId,
    required this.identityNumber,
    required this.relationship,
    required this.biography,
    required this.isVerified,
    required this.muteUntil,
    required this.isScam,
    this.fullName,
    this.avatarUrl,
    this.phone,
    this.createdAt,
    this.hasPin,
    this.app,
    this.codeId,
    this.codeUrl,
    this.isDeactivated,
    this.membership,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'identity_number')
  final String identityNumber;
  @JsonKey(name: 'relationship')
  final UserRelationship? relationship;
  @JsonKey(name: 'biography')
  final String biography;
  @JsonKey(name: 'full_name')
  final String? fullName;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'is_verified')
  final bool isVerified;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'mute_until')
  final String muteUntil;
  @JsonKey(name: 'has_pin')
  final bool? hasPin;
  @JsonKey(name: 'app')
  final App? app;
  @JsonKey(name: 'is_scam')
  final bool isScam;

  @JsonKey(name: 'code_id')
  final String? codeId;
  @JsonKey(name: 'code_url')
  final String? codeUrl;
  @JsonKey(name: 'is_deactivated')
  final bool? isDeactivated;

  @JsonKey(name: 'membership')
  final Membership? membership;

  @override
  List<Object?> get props => [
    userId,
    identityNumber,
    relationship,
    biography,
    fullName,
    avatarUrl,
    phone,
    isVerified,
    createdAt,
    muteUntil,
    hasPin,
    app,
    isScam,
    codeId,
    codeUrl,
    isDeactivated,
    membership,
  ];
}
