import 'package:bot_api_dart_client/bot_api_dart_client.dart';
import './config.dart';

void main() async {
  var client = Client('UA', uid, sid, private);
  await getMe(client.dio).then((value) {
    MixinResponse.fromJson(value.data).handleResponse(
        onSuccess: (Map<String, dynamic> response) {
          var user = User.fromJson(response);
          print(user.toJson());
        },
        onFailure: (MixinError error) => {print(error.toJson())});
  });
}
