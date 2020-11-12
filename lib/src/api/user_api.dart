import 'package:dio/dio.dart';
import '../vo/mixin_response.dart';

class UserApi {
  final Dio dio;

  UserApi({this.dio});

  Future<Response<MixinResponse>> getMe(Dio dio) {
    return dio.get<MixinResponse>('/me');
  }
}
