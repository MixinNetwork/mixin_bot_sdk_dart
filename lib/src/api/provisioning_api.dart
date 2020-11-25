import 'package:dio/dio.dart';

import '../vo/mixin_response.dart';
import '../vo/provisioning.dart';

class ProvisioningApi {
  final Dio dio;

  ProvisioningApi({this.dio});

  Future<MixinResponse<Provisioning>> getProvisioningId(String deviceId) {
    return MixinResponse.request<Provisioning>(
        dio.post('/provisionings', data: {'device': deviceId}));
  }

  Future<MixinResponse<Provisioning>> getProvisioning(String deviceId) {
    return MixinResponse.request<Provisioning>(
        dio.get('/provisionings/$deviceId'));
  }
}
