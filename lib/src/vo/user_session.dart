import 'package:json_annotation/json_annotation.dart';

part 'user_session.g.dart';

@JsonSerializable()
class UserSession {
  @JsonKey(name: 'user_id', nullable: false)
  String userId;
  @JsonKey(name: 'session_id', nullable: false)
  String sessionId;
  @JsonKey(name: 'platform', nullable: true)
  String platform;

  UserSession(this.userId, this.sessionId, this.platform);

  factory UserSession.fromJson(Map<String, dynamic> json) =>
      _$UserSessionFromJson(json);

  Map<String, dynamic> toJson() => _$UserSessionToJson(this);
}
