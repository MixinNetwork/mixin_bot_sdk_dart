import 'package:bot_api_dart_client/bot_api_dart_client.dart';
import './config.dart';

void main() async {
  var client = Client('UA', 'zh', 'desktop', uid, sid, private);
  await getMe(client.dio).then((value) {
    var user = User.fromJson(value.data['data']);
    print(user.avatarUrl);
  });
}
