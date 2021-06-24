import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:mixin_bot_sdk_dart/src/error/mixin_api_error.dart';
import 'package:test/test.dart';

import 'config.dart';

void main() {
  var client = Client(userId: uid, sessionId: sid, privateKey: private);

  test('test getAddressesByAssetId', () async {
    try {
      var mixinResponse = await client.addressApi.getAddressesByAssetId(btcId);
      print(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });

  test('test addAddress', () async {
    try {
      var mixinResponse =
          await client.addressApi.addAddress(mockAddressRequest);
      print(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });

  test('test getAddressById', () async {
    try {
      var mixinResponse = await client.addressApi.getAddressById(addressId);
      print(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });

  test('test deleteAddressById', () async {
    try {
      var mixinResponse =
          await client.addressApi.deleteAddressById(addressId, '');
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });
}
