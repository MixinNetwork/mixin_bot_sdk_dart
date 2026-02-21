import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:test/test.dart';

import 'config.dart';

void main() {
  final client = Client(
    userId: uid,
    sessionId: sid,
    sessionPrivateKey: private,
  );

  test('test getAddressesByAssetId', () async {
    try {
      final mixinResponse = await client.addressApi.getAddressesByAssetId(
        btcId,
      );
      testPrint(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });

  test('test addAddress', () async {
    try {
      final mixinResponse = await client.addressApi.addAddress(
        mockAddressRequest,
      );
      testPrint(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });

  test('test getAddressById', () async {
    try {
      final mixinResponse = await client.addressApi.getAddressById(addressId);
      testPrint(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });

  test('test deleteAddressById', () async {
    try {
      await client.addressApi.deleteAddressById(addressId, '');
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });
}
