import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import './app.dart';
import 'user_relationship.dart';

part 'user.g.dart';

@JsonSerializable()
@UserRelationshipJsonConverter()
class User with EquatableMixin {
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
    this.appId,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @JsonKey(name: 'user_id')
  String userId;
  @JsonKey(name: 'identity_number')
  String identityNumber;
  @JsonKey(name: 'relationship')
  UserRelationship? relationship;
  @JsonKey(name: 'biography')
  String biography;
  @JsonKey(name: 'full_name')
  String? fullName;
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'is_verified')
  bool isVerified;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'mute_until')
  String muteUntil;
  @JsonKey(name: 'has_pin')
  bool? hasPin;
  @JsonKey(name: 'app')
  App? app;
  @JsonKey(name: 'app_id')
  String? appId;
  @JsonKey(name: 'is_scam')
  bool isScam;

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
        appId,
        isScam,
      ];
}
