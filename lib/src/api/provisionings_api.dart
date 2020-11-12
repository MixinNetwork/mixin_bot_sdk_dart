import 'package:dio/dio.dart';

class ProvisioningApi {
  final Dio dio;

  ProvisioningApi({this.dio});

  Future<Response> getProvisioningId(String deviceId) async {
    return await dio.post('/provisionings', data: {'device': deviceId});
  }
}
