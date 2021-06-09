import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:mixin_bot_sdk_dart/src/error/mixin_api_error.dart';
import 'package:test/test.dart';

import 'config.dart';

void main() {
  group('user apis', () {
    final client = Client(userId: uid, sessionId: sid, privateKey: private);

    test('test getUsers', () async {
      try {
        final mixinResponse = await client.userApi.getUsers(uids);
        print(mixinResponse.data.map((e) => e.toJson()).toList());
      } catch (e) {
        if (e is MixinApiError) {
          print(e.error);
        }
      }
    });

    test('test getUserById', () async {
      const id = '773e5e77-4107-45c2-b648-8fc722ed77f5';
      try {
        final mixinResponse = await client.userApi.getUserById(id);
        print(mixinResponse.data.toJson());
      } catch (e) {
        if (e is MixinApiError) {
          print(e.error);
        }
      }
    });

    // TODO
    // test('test relationships', () async {
    //   await client.userApi
    //       .relationships(mockRelationshipRequest)
    //       .then((response) {
    //     response.handleResponse(
    //         onSuccess: (User user) {
    //           print(user.toJson());
    //         },
    //         onFailure: (MixinError error) => {print(error.toJson())});
    //   });
    // });

    // TODO
    // test('test report', () async {
    //   await client.userApi.report(mockRelationshipRequest).then((response) {
    //     response.handleResponse(
    //         onSuccess: (User user) {
    //           print(user.toJson());
    //         },
    //         onFailure: (MixinError error) => {print(error.toJson())});
    //   });
    // });

    test('test blockingUsers', () async {
      try {
        final mixinResponse = await client.userApi.blockingUsers();
        print(mixinResponse.data.map((e) => e.toJson()).toList());
      } catch (e) {
        if (e is MixinApiError) {
          print(e.error);
        }
      }
    });
  });

  test('test getSessions', () async {
    final client = Client(userId: uid, sessionId: sid, privateKey: private);
    try {
      final mixinResponse = await client.userApi.getSessions(uids);
      print(mixinResponse.data.map((e) => e.toJson()).toList());
    } catch (e) {
      if (e is MixinApiError) {
        print(e.error);
      }
    }
  });
}
