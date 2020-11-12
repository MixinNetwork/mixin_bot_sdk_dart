import 'package:dio/dio.dart';
import 'package:bot_api_dart_client/src/vo/mixin_response.dart';

class UserApi {
  final Dio dio;

  UserApi({this.dio});

  Future<Response<MixinResponse>> getMe(Dio dio) async {
    return await dio.get<MixinResponse>('/me');
  }
}
