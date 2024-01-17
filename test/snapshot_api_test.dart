import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:test/test.dart';

import 'config.dart';

void main() {
  final client =
      Client(userId: uid, sessionId: sid, sessionPrivateKey: private);

  test('test getSnapshots', () async {
    try {
      final mixinResponse = await client.snapshotApi.getSnapshots();
      testPrint(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });

  test('test getSnapshotById', () async {
    try {
      final mixinResponse =
          await client.snapshotApi.getSnapshotById(snapshotId);
      testPrint(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });

  test('test getSnapshotsByAssetId', () async {
    try {
      final mixinResponse =
          await client.snapshotApi.getSnapshotsByAssetId(btcId);
      testPrint(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });

  test('test getSnapshotByTraceId', () async {
    try {
      final mixinResponse =
          await client.snapshotApi.getSnapshotByTraceId(traceId);
      testPrint(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });

  test('test getTicker', () async {
    try {
      final mixinResponse = await client.snapshotApi.getTicker(btcId);
      testPrint(mixinResponse.data);
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });
}
