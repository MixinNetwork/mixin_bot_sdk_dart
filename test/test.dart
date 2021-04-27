import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'dart:io';

import 'package:mixin_bot_sdk_dart/src/error/mixin_api_error.dart';

void main() {
  testProvisioningId();
}

Future<void> testProvisioningId() async {
  var client = Client();
  try {
    var mixinResponse = await client.provisioningApi
          .getProvisioningId(Platform.operatingSystem);
    print(mixinResponse.data.toJson());
  } catch (e) {
    if(e is MixinApiError) {
      print(e.error.toJson());
    }
  }
}

