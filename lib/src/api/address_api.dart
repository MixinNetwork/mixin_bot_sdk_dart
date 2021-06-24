import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';
import '../vo/address.dart';
import '../vo/request/address_request.dart';

class AddressApi {
  AddressApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<List<Address>>> getAddressesByAssetId(String assetId) =>
      MixinResponse.request<List<Address>>(
          dio.get('/assets/$assetId/addresses'));

  Future<MixinResponse<Address>> addAddress(AddressRequest request) =>
      MixinResponse.request<Address>(dio.post('/addresses', data: request));

  Future<MixinResponse<Address>> getAddressById(String id) =>
      MixinResponse.request<Address>(dio.get('/addresses/$id'));

  Future<MixinResponse<void>> deleteAddressById(String id, String pin) =>
      MixinResponse.request<void>(dio.post('/addresses/$id/delete', data: pin));
}
