import 'package:dio/dio.dart';
import '../vo/mixin_response.dart';
import '../vo/oauth_response.dart';
import '../vo/request/oauth_request.dart';

class OauthApi {
  OauthApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<OauthResponse>> post(OauthRequest request) =>
      MixinResponse.request<OauthResponse>(
          dio.post('/oauth/token', data: request));
}
