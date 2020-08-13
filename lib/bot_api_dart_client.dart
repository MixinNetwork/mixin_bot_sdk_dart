import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:uuid/uuid.dart';
import 'package:cryptography/cryptography.dart';
import 'package:jose/jose.dart';

class Client {
  Dio dio;
  String userId;
  String sessionId;

  Client(String ua, language, deviceId, userId, sessionId, privateKey) {
    dio = Dio();
    dio.options.baseUrl = 'https://mixin-api.zeromesh.net';
    dio.options.connectTimeout = 10000; // 10s
    dio.options.sendTimeout = 10000;
    dio.options.receiveTimeout = 10000;
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      options.headers['User-Agent'] = ua;
      options.headers['Accept-Language'] = language;
      options.headers['Mixin-Device-Id'] = deviceId;
      options.headers['Authorization'] = 'Bearer ' +
          await signAuthenticationToken(options, userId, sessionId, privateKey);
      return options;
    }, onResponse: (Response response) async {
      return response;
    }, onError: (DioError error) async {
      return error;
    }));
  }

  Future<String> signAuthenticationToken(
      RequestOptions options, String userId, sessionId, privateKey) async {
    final body = (options.data ?? '').toString();
    final bytes =
        utf8.encode(options.method + options.path + body); // todo body
    final hash = await sha256.hash(bytes);
    final claims = JsonWebTokenClaims.fromJson({
      'uid': userId,
      'sid': sessionId,
      "iat": (DateTime.now().millisecondsSinceEpoch / 1000).floor(),
      "exp": (DateTime.now().add(Duration(days: 365)).millisecondsSinceEpoch /
              1000)
          .floor(),
      "jti": Uuid().v4(),
      'sig': hex.encode(hash.bytes),
      'scp': 'FULL',
    });

    final key = JsonWebKey.fromPem(privateKey);
    final builder = JsonWebSignatureBuilder();
    builder.jsonContent = claims.toJson();
    builder.addRecipient(key, algorithm: 'RS512');

    return '${builder.build().toCompactSerialization()}';
  }
}
