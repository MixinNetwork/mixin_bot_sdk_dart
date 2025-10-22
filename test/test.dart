import 'dart:io';

import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';

import 'config.dart';

void main() async {
  await testProvisioningId();
}

Future<void> testProvisioningId() async {
  final client = Client();
  try {
    final mixinResponse = await client.provisioningApi
        .getProvisioningId(Platform.operatingSystem);
    testPrint(mixinResponse.data.toJson());
  } catch (e) {
    if (e is MixinApiError) {
      testPrint(e.error);
    }
  }
}
