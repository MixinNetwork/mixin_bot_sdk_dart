import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:test/test.dart';

import 'config.dart';

void main() {
  final client = Client(userId: uid, sessionId: sid, privateKey: private);

  test('test transfer', () async {
    try {
      final mixinResponse =
          await client.transferApi.transfer(mockTransferRequest);
      testPrint(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });

  test('test pay', () async {
    try {
      final mixinResponse = await client.transferApi.pay(mockPaymentRequest);
      testPrint(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });

  test('test withdrawal', () async {
    try {
      final mixinResponse =
          await client.transferApi.withdrawal(mockWithdrawalRequest);
      testPrint(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });
}
