import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';

class AddressApi {
  AddressApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<List<Address>>> getAddressesByAssetId(String assetId) =>
      MixinResponse.requestList(
        dio.get('/assets/${Uri.encodeComponent(assetId)}/addresses'),
        Address.fromJson,
      );

  Future<MixinResponse<Address>> addAddress(AddressRequest request) =>
      MixinResponse.request<Address>(
        dio.post('/addresses', data: request),
        Address.fromJson,
      );

  Future<MixinResponse<Address>> getAddressById(String id) =>
      MixinResponse.request<Address>(
        dio.get('/addresses/${Uri.encodeComponent(id)}'),
        Address.fromJson,
      );

  Future<MixinResponse<void>> deleteAddressById(String id, String pin) =>
      MixinResponse.requestVoid(dio.post(
        '/addresses/${Uri.encodeComponent(id)}/delete',
        data: {'pin': pin},
      ));
}
