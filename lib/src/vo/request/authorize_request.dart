import 'package:json_annotation/json_annotation.dart';

part 'authorize_request.g.dart';

@JsonSerializable()
class AuthorizeRequest {
  AuthorizeRequest({
    required this.authorizationId,
    required this.scopes,
    this.pin,
  });

  factory AuthorizeRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthorizeRequestFromJson(json);

  @JsonKey(name: 'authorization_id')
  final String authorizationId;

  final List<String> scopes;

  @JsonKey(name: 'pin_base64')
  final String? pin;

  Map<String, dynamic> toJson() => _$AuthorizeRequestToJson(this);
}
