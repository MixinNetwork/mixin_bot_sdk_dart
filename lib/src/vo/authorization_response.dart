import 'package:json_annotation/json_annotation.dart';

import 'app.dart';
import 'code_type_interface.dart';

part 'authorization_response.g.dart';

@JsonSerializable()
class AuthorizationResponse implements CodeTypeInterface {
  AuthorizationResponse(
    this.authorizationId,
    this.authorizationCode,
    this.scopes,
    this.codeId,
    this.app,
    this.createdAt,
    this.accessedAt,
  );

  factory AuthorizationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationResponseFromJson(json);

  @JsonKey(name: 'authorization_id')
  final String authorizationId;
  @JsonKey(name: 'authorization_code')
  final String authorizationCode;
  final List<String> scopes;
  @JsonKey(name: 'code_id')
  final String codeId;
  final App app;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'accessed_at')
  final String accessedAt;

  Map<String, dynamic> toJson() => _$AuthorizationResponseToJson(this);
}
