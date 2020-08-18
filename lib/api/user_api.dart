import 'package:dio/dio.dart';

Future<Response> getMe(Dio dio) async {
  return await dio.get('/me');
}
