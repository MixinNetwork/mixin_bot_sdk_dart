import 'package:bot_api_dart_client/bot_api_dart_client.dart';
import './config.dart';

void main() async {
  var dio = Client('', 'l', '', uid, sid, private);
  var response = await dio.dio.get('/me');
  print(response);
}
