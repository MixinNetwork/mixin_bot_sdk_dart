import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'oauth_response.g.dart';

@JsonSerializable()
class OauthResponse with EquatableMixin {
  OauthResponse({required this.accessToken, required this.scope});

  factory OauthResponse.fromJson(Map<String, dynamic> json) =>
      _$OauthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OauthResponseToJson(this);

  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'scope')
  final String scope;

  @override
  List<Object> get props => [accessToken, scope];
}
