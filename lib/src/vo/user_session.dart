import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_session.g.dart';

@JsonSerializable()
class UserSession with EquatableMixin {
  @JsonKey(name: 'user_id', disallowNullValue: true)
  String userId;
  @JsonKey(name: 'session_id', disallowNullValue: true)
  String sessionId;
  @JsonKey(name: 'platform', disallowNullValue: false)
  String? platform;
  @JsonKey(name: 'public_key', disallowNullValue: false)
  String? publicKey;

  UserSession(
    this.userId,
    this.sessionId,
    this.platform,
    this.publicKey,
  );

  factory UserSession.fromJson(Map<String, dynamic> json) =>
      _$UserSessionFromJson(json);

  Map<String, dynamic> toJson() => _$UserSessionToJson(this);

  @override
  List<Object?> get props => [
        userId,
        sessionId,
        platform,
        publicKey,
      ];
}
