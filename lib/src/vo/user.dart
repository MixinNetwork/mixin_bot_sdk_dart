import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import './app.dart';

part 'user.g.dart';

@JsonSerializable()
class User with EquatableMixin {
  @JsonKey(name: 'user_id', nullable: false)
  String userId;
  @JsonKey(name: 'identity_number', nullable: false)
  String identityNumber;
  @JsonKey(name: 'relationship', nullable: false)
  String relationship;
  @JsonKey(name: 'biography', nullable: false)
  String biography;
  @JsonKey(name: 'full_name')
  String fullName;
  @JsonKey(name: 'avatar_url')
  String avatarUrl;
  @JsonKey(name: 'phone')
  String phone;
  @JsonKey(name: 'is_verified')
  bool isVerified;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'mute_until')
  String muteUntil;
  @JsonKey(name: 'has_pin')
  bool hasPin;
  @JsonKey(name: 'app')
  App app;
  @JsonKey(name: 'app_id')
  String appId;
  @JsonKey(name: 'is_scam')
  bool isScam;

  User({
    this.userId,
    this.identityNumber,
    this.relationship,
    this.biography,
    this.fullName,
    this.avatarUrl,
    this.phone,
    this.isVerified,
    this.createdAt,
    this.muteUntil,
    this.hasPin,
    this.app,
    this.appId,
    this.isScam,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props => [
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
