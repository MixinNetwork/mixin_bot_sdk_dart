import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:mixin_bot_sdk_dart/src/client.dart';
import 'package:mixin_bot_sdk_dart/src/vo/signal_key_count.dart';
import 'package:test/test.dart';

import 'config.dart';

void main() {
  group('user apis', () {
    var client = Client('UA', uid, sid, private);

    test('test getMe', () async {
      await client.accountApi.getMe().then((response) {
        response.handleResponse(
            onSuccess: (User user) {
              print(user.toJson());
            },
            onFailure: (MixinError error) => {print(error.toJson())});
      });
    });

    test('test getSignalCountKey', () async {
      await client.accountApi.getSignalKeyCount().then((response) {
        response.handleResponse(
            onSuccess: (SignalKeyCount signalKeyCount) {
              print(signalKeyCount.toJson());
            },
            onFailure: (MixinError error) => {print(error.toJson())});
      });
    });

    test('test logout', () async {
      await client.accountApi.logout().then((response) {});
    });
  });
}
