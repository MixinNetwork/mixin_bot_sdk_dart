import 'package:dio/dio.dart';

Future<Response> getProvisioningId(Dio dio, String deviceId) async {
  return await dio.post('/provisionings', data: {'device': deviceId});
}
