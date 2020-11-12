import 'package:dio/dio.dart';
import '../vo/mixin_response.dart';

class UserApi {
  final Dio dio;

  UserApi({this.dio});

  Future<Response<MixinResponse>> getMe(Dio dio) async {
    return await dio.get<MixinResponse>('/me');
  }
}
