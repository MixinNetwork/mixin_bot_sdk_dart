import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';

class AddressApi {
  AddressApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<List<Address>>> getAddressesByAssetId(String assetId) =>
      MixinResponse.requestList(
        dio.get('/assets/$assetId/addresses'),
        (json) => Address.fromJson(json),
      );

  Future<MixinResponse<Address>> addAddress(AddressRequest request) =>
      MixinResponse.request<Address>(
        dio.post('/addresses', data: request),
        (json) => Address.fromJson(json),
      );

  Future<MixinResponse<Address>> getAddressById(String id) =>
      MixinResponse.request<Address>(
        dio.get('/addresses/$id'),
        (json) => Address.fromJson(json),
      );

  Future<MixinResponse<void>> deleteAddressById(String id, String pin) =>
      MixinResponse.requestVoid(dio.post(
        '/addresses/$id/delete',
        data: {'pin': pin},
      ));
}
