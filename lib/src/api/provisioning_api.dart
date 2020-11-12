import 'package:dio/dio.dart';

import '../vo/mixin_response.dart';

class ProvisioningApi {
  final Dio dio;

  ProvisioningApi({this.dio});

  Future<Response<MixinResponse>> getProvisioningId(String deviceId) {
    return dio.post('/provisionings', data: {'device': deviceId});
  }
}
