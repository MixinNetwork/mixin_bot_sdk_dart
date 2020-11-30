import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'dart:io';

void main() {
  testProvisioningId();
  testStringExtension();
}

void testProvisioningId() {
  var client = Client('UA');
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

void testStringExtension() {
  String str;
  if (str.isNullOrEmpty) {
    print('empty or null');
  } else {
    print(str);
  }
  str = '';
  if (str.isNullOrEmpty) {
    print('empty or null');
  } else {
    print(str);
  }
  str = 'str';
  if (str.isNullOrEmpty) {
    print('empty or null');
  } else {
    print(str);
  }
}
