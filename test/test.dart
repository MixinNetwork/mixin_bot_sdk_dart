import 'package:bot_api_dart_client/bot_api_dart_client.dart';
import './config.dart';
import 'dart:io';

void main() {
  testUserApi();
  testProvisioningId();
  testStringExtension();
}

void testUserApi() async {
  var client = Client('UA', uid, sid, private);

  await client.userApi.getMe(client.dio).then((response) {
    response.data.handleResponse<User>(
        onSuccess: (User user) {
          print(user.toJson());
        },
        onFailure: (MixinError error) => {print(error.toJson())});
  });
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
