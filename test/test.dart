import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'dart:io';

void main() {
  testProvisioningId();
}

void testProvisioningId() {
  var client = Client();
  client.provisioningApi
      .getProvisioningId(Platform.operatingSystem)
      .then((response) => {
            response.handleResponse(onSuccess: (Provisioning provisioning) {
              print(provisioning.toJson());
            }, onFailure: (MixinError error) {
              print(error.toJson());
            })
          });
}

