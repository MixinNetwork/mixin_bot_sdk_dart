import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:test/test.dart';

import 'config.dart';

void main() {
  group('user apis', () {
    final client = Client(
      userId: uid,
      sessionId: sid,
      sessionPrivateKey: private,
    );

    test('test getUsers', () async {
      try {
        final mixinResponse = await client.userApi.getUsers(uids);
        testPrint(mixinResponse.data.map((e) => e.toJson()).toList());
      } catch (e) {
        if (e is MixinApiError) {
          testPrint(e.error);
        }
      }
    });

    test('test getUserById', () async {
      const id = '773e5e77-4107-45c2-b648-8fc722ed77f5';
      try {
        final mixinResponse = await client.userApi.getUserById(id);
        testPrint(mixinResponse.data.toJson());
      } catch (e) {
        if (e is MixinApiError) {
          testPrint(e.error);
        }
      }
    });

    test('test blockingUsers', () async {
      try {
        final mixinResponse = await client.userApi.blockingUsers();
        testPrint(mixinResponse.data.map((e) => e.toJson()).toList());
      } catch (e) {
        if (e is MixinApiError) {
          testPrint(e.error);
        }
      }
    });
  });

  test('test getSessions', () async {
    final client = Client(
      userId: uid,
      sessionId: sid,
      sessionPrivateKey: private,
    );
    try {
      final mixinResponse = await client.userApi.getSessions(uids);
      testPrint(mixinResponse.data.map((e) => e.toJson()).toList());
    } catch (e) {
      if (e is MixinApiError) {
        testPrint(e.error);
      }
    }
  });
}
