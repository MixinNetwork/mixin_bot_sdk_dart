import 'package:dio/dio.dart';

import '../vo/account.dart';
import '../vo/mixin_response.dart';
import '../vo/provisioning.dart';
import '../vo/provisioning_id.dart';
import '../vo/request/provisioning_request.dart';

class ProvisioningApi {
  ProvisioningApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<ProvisioningId>> getProvisioningId(String deviceId) =>
      MixinResponse.request<ProvisioningId>(
        dio.post('/provisionings', data: {'device': deviceId}),
        (json) => ProvisioningId.fromJson(json),
      );

  Future<MixinResponse<Provisioning>> getProvisioning(String deviceId) =>
      MixinResponse.request<Provisioning>(
        dio.get('/provisionings/$deviceId'),
        (json) => Provisioning.fromJson(json),
      );

  Future<MixinResponse<Account>> verifyProvisioning(ProvisioningRequest data) =>
      MixinResponse.request<Account>(
        dio.post('/provisionings/verify', data: data),
        (json) => Account.fromJson(json),
      );
}
