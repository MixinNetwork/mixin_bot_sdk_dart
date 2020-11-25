import 'package:bot_api_dart_client/bot_api_dart_client.dart';
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
            response.data.handleResponse<Provisioning>(
                onSuccess: (Provisioning provisioning) {
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
