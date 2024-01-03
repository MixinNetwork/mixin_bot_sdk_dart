import 'dart:io';

import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';

void main() {
  testProvisioningId();
}

Future<void> testProvisioningId() async {
  final client = Client();
  try {
    final mixinResponse = await client.provisioningApi
        .getProvisioningId(Platform.operatingSystem);
    print(mixinResponse.data.toJson());
  } catch (e) {
    if (e is MixinApiError) {
      print(e.error.toJson());
    }
  }
}
