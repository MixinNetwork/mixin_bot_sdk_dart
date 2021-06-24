import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:mixin_bot_sdk_dart/src/error/mixin_api_error.dart';
import 'package:test/test.dart';

import 'config.dart';

void main() {
  var client = Client(userId: uid, sessionId: sid, privateKey: private);

  test('test getSnapshots', () async {
    try {
      var mixinResponse = await client.snapshotApi.getSnapshots();
      print(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });

  test('test getSnapshotById', () async {
    try {
      var mixinResponse = await client.snapshotApi.getSnapshotById(snapshotId);
      print(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });

  test('test getSnapshotsByAssetId', () async {
    try {
      var mixinResponse = await client.snapshotApi.getSnapshotsByAssetId(btcId);
      print(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });

  test('test getSnapshotByTraceId', () async {
    try {
      var mixinResponse =
          await client.snapshotApi.getSnapshotByTraceId(traceId);
      print(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });

  test('test getTicker', () async {
    try {
      var mixinResponse = await client.snapshotApi.getTicker(btcId);
      print(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });
}
