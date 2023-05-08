import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';

class OauthApi {
  OauthApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<OauthResponse>> post(OauthRequest request) =>
      MixinResponse.request<OauthResponse>(
        dio.post('/oauth/token', data: request),
        OauthResponse.fromJson,
      );

  Future<MixinResponse<AuthorizationResponse>> authorize(
          AuthorizeRequest request) =>
      MixinResponse.request<AuthorizationResponse>(
        dio.post('/oauth/authorize', data: request),
        (json) => AuthorizationResponse.fromJson(json),
      );

  Future<MixinResponse<List<AuthorizationResponse>>> authorizations(
    String? appId,
  ) =>
      MixinResponse.requestList(
        dio.get(
          '/authorizations',
          queryParameters: {
            if (appId != null) 'app': appId,
          },
        ),
        (json) => AuthorizationResponse.fromJson(json),
      );

  Future<MixinResponse<void>> deAuthorize(String clientId) =>
      MixinResponse.requestVoid(
        dio.post('/oauth/cancel', data: {'client_id': clientId}),
      );
}
