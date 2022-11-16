import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:mixin_bot_sdk_dart/src/error/mixin_api_error.dart';
import 'package:test/test.dart';

import 'config.dart';

void main() {
  var client = Client(userId: uid, sessionId: sid, privateKey: private);

  test('test transfer', () async {
    try {
      var mixinResponse =
          await client.transferApi.transfer(mockTransferRequest);
      print(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });

  test('test pay', () async {
    try {
      var mixinResponse = await client.transferApi.pay(mockPaymentRequest);
      print(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });

  test('test withdrawal', () async {
    try {
      var mixinResponse =
          await client.transferApi.withdrawal(mockWithdrawalRequest);
      print(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });
}
