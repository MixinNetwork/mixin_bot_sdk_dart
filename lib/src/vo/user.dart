import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mixin_bot_sdk_dart/src/vo/user_relationship.dart';
import './app.dart';

part 'user.g.dart';

@JsonSerializable()
@UserRelationshipJsonConverter()
class User with EquatableMixin {
  @JsonKey(name: 'user_id', disallowNullValue: true)
  String userId;
  @JsonKey(name: 'identity_number', disallowNullValue: true)
  String identityNumber;
  @JsonKey(name: 'relationship', disallowNullValue: false)
  UserRelationship relationship;
  @JsonKey(name: 'biography', disallowNullValue: true)
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
  @JsonKey(name: 'app', ignore: true)
  App? app;
  @JsonKey(name: 'app_id')
  String? appId;
  @JsonKey(name: 'is_scam')
  bool isScam;

  User({
    required this.userId,
    required this.identityNumber,
    required this.relationship,
    required this.biography,
    this.fullName,
    this.avatarUrl,
    this.phone,
    required this.isVerified,
    this.createdAt,
    required this.muteUntil,
    this.hasPin,
    this.app,
    this.appId,
    required this.isScam,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

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
