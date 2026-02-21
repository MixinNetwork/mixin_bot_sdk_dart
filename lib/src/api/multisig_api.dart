import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';

class MultisigApi {
  MultisigApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<void>> sign(String id, PinRequest request) =>
      MixinResponse.requestVoid(dio.post('/multisigs/$id/sign', data: request));

  Future<MixinResponse<void>> unlock(String id, PinRequest request) =>
      MixinResponse.requestVoid(
        dio.post('/multisigs/$id/unlock', data: request),
      );

  Future<MixinResponse<void>> cancel(String id) =>
      MixinResponse.requestVoid(dio.post('/multisigs/$id/cancel'));

  Future<MixinResponse<void>> transaction(RawTransactionRequest request) =>
      MixinResponse.requestVoid(dio.post('/transactions', data: request));
}
