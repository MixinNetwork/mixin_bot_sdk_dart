import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:mixin_bot_sdk_dart/src/error/mixin_api_error.dart';
import 'package:test/test.dart';

import 'config.dart';

void main() {
  var client = Client(userId: uid, sessionId: sid, privateKey: private);

  test('test sign', () async {
    try {
      var mixinResponse =
          await client.multisigApi.sign(multisigId, mockPinRequest.pin);
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });

  test('test unlock', () async {
    try {
      var mixinResponse =
          await client.multisigApi.unlock(multisigId, mockPinRequest.pin);
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });

  test('test cancel', () async {
    try {
      var mixinResponse = await client.multisigApi.cancel(multisigId);
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });

  test('test transaction', () async {
    try {
      var mixinResponse =
          await client.multisigApi.transaction(mockRawTransactionRequest);
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });
}
