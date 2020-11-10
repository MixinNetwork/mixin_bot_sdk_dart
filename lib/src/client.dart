import 'package:dio/dio.dart';

import 'auth.dart';

class Client {
  Dio dio;
  String userId;
  String sessionId;

  Client(String ua, userId, sessionId, privateKey) {
    dio = Dio();
    dio.options.baseUrl = 'https://api.mixin.one';
    dio.options.connectTimeout = 10000; // 10s
    dio.options.sendTimeout = 10000;
    dio.options.receiveTimeout = 10000;
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      final body = (options.data ?? '').toString();
      options.headers['User-Agent'] = ua;
      options.headers['Accept-Language'] = 'en_US';
      options.headers['Authorization'] = 'Bearer ' +
          signAuthenticationToken(
            userId,
            sessionId,
            privateKey,
            options.method,
            options.path,
            body,
          );
      return options;
    }, onResponse: (Response response) async {
      return response;
    }, onError: (DioError error) async {
      return error;
    }));
  }
}
