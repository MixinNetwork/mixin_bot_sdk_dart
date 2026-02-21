import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:test/test.dart';

import 'config.dart';

void main() {
  final client = Client(
    userId: uid,
    sessionId: sid,
    sessionPrivateKey: private,
  );

  test('test getAssetById', () async {
    try {
      final mixinResponse = await client.assetApi.getAssetById(btcId);
      testPrint(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });

  test('test getAssets', () async {
    try {
      final mixinResponse = await client.assetApi.getAssets();
      testPrint(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });

  test('test getAssetFee', () async {
    try {
      final mixinResponse = await client.assetApi.getAssetFee(btcId);
      testPrint(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });

  test('test queryAsset', () async {
    try {
      final mixinResponse = await client.assetApi.queryAsset('btc');
      testPrint(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      } else {
        rethrow;
      }
    }
  });

  test('test pendingDeposits', () async {
    try {
      final mixinResponse = await client.assetApi.pendingDeposits(btcId);
      testPrint(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });

  test('test getTopAssets', () async {
    try {
      final mixinResponse = await client.assetApi.getTopAssets();
      testPrint('top asset: ${mixinResponse.data}');
    } catch (e, stacktrace) {
      testPrint('error: $e $stacktrace');
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });
}
