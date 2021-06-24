import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:mixin_bot_sdk_dart/src/error/mixin_api_error.dart';
import 'package:test/test.dart';

import 'config.dart';

void main() {
  var client = Client(userId: uid, sessionId: sid, privateKey: private);

  test('test getAssetById', () async {
    try {
      var mixinResponse = await client.assetApi.getAssetById(btcId);
      print(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });

  test('test getAssets', () async {
    try {
      var mixinResponse = await client.assetApi.getAssets();
      print(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });

  test('test getAssetFee', () async {
    try {
      var mixinResponse = await client.assetApi.getAssetFee(btcId);
      print(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });

  test('test queryAsset', () async {
    try {
      var mixinResponse = await client.assetApi.queryAsset('btc');
      print(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });

  test('test pendingDeposits', () async {
    try {
      var mixinResponse = await client.assetApi.pendingDeposits(btcId);
      print(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });

  test('test getTopAssets', () async {
    try {
      var mixinResponse = await client.assetApi.getTopAssets();
      print(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });
}
