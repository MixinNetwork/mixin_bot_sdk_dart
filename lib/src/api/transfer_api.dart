import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';
import '../vo/payment_response.dart';
import '../vo/request/transfer_request.dart';
import '../vo/request/withdrawal_request.dart';
import '../vo/snapshot.dart';

class TransferApi {
  TransferApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<Snapshot>> transfer(TransferRequest request) =>
      MixinResponse.request<Snapshot>(dio.post('/transfers', data: request));

  Future<MixinResponse<PaymentResponse>> pay(TransferRequest request) =>
      MixinResponse.request<PaymentResponse>(
          dio.post('/payments', data: request));

  Future<MixinResponse<Snapshot>> withdrawal(WithdrawalRequest request) =>
      MixinResponse.request<Snapshot>(dio.post('/withdrawals', data: request));
}
