import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:test/test.dart';

import 'config.dart';

void main() {
  final client = Client(
    userId: uid,
    sessionId: sid,
    sessionPrivateKey: private,
  );

  test('test sign', () async {
    try {
      await client.multisigApi.sign(multisigId, mockPinRequest);
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });

  test('test unlock', () async {
    try {
      await client.multisigApi.unlock(multisigId, mockPinRequest);
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });

  test('test cancel', () async {
    try {
      await client.multisigApi.cancel(multisigId);
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });

  test('test transaction', () async {
    try {
      await client.multisigApi.transaction(mockRawTransactionRequest);
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });
}
