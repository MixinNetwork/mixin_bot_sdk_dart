import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';

class TransferApi {
  TransferApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<Snapshot>> transfer(TransferRequest request) =>
      MixinResponse.request<Snapshot>(
        dio.post('/transfers', data: request),
        (json) => Snapshot.fromJson(json),
      );

  Future<MixinResponse<PaymentResponse>> pay(PaymentRequest request) =>
      MixinResponse.request<PaymentResponse>(
        dio.post('/payments', data: request),
        (json) => PaymentResponse.fromJson(json),
      );

  Future<MixinResponse<Snapshot>> withdrawal(WithdrawalRequest request) =>
      MixinResponse.request<Snapshot>(
        dio.post('/withdrawals', data: request),
        (json) => Snapshot.fromJson(json),
      );
}
