import 'package:bot_api_dart_client/bot_api_dart_client.dart';
import './config.dart';

void main() async {
  var client = Client('UA', uid, sid, private);
  await getMe(client.dio).then((response) {
    response.data.handleResponse<User>(
        onSuccess: (User user) {
          print(user.toJson());
        },
        onFailure: (MixinError error) => {print(error.toJson())});
  });
}
