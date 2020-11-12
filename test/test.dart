import 'package:bot_api_dart_client/bot_api_dart_client.dart';
import './config.dart';

void main() async {
  Mixin.init(userId: uid, sessionId: sid, privateKey: private);
  var client = Client('UA');
  await client.userApi.getMe(client.dio).then((response) {
    response.data.handleResponse<User>(
        onSuccess: (User user) {
          print(user.toJson());
        },
        onFailure: (MixinError error) => {print(error.toJson())});
  });
}
