import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_session.g.dart';

@JsonSerializable()
class UserSession with EquatableMixin {

  UserSession(
    this.userId,
    this.sessionId,
    this.platform,
    this.publicKey,
  );

  factory UserSession.fromJson(Map<String, dynamic> json) =>
      _$UserSessionFromJson(json);

  Map<String, dynamic> toJson() => _$UserSessionToJson(this);

  @JsonKey(name: 'user_id')
  String userId;
  @JsonKey(name: 'session_id')
  String sessionId;
  @JsonKey(name: 'platform')
  String? platform;
  @JsonKey(name: 'public_key')
  String? publicKey;

  @override
  List<Object?> get props => [
        userId,
        sessionId,
        platform,
        publicKey,
      ];
}
