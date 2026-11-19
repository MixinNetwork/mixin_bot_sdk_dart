import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:test/test.dart';

class _RecordingAdapter implements HttpClientAdapter {
  RequestOptions? request;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    request = options;
    return ResponseBody.fromString(
      '{"data":{}}',
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

String? _jti(String authorization) {
  final part = authorization.substring('Bearer '.length).split('.')[1];
  final payload =
      jsonDecode(utf8.decode(base64Url.decode(base64Url.normalize(part))))
          as Map<String, dynamic>;
  return payload['jti'] as String?;
}

void main() {
  (Client, _RecordingAdapter) client() {
    final client = Client(
      userId: 'user',
      sessionId: 'session',
      sessionPrivateKey: Key.fromSeed(Uint8List.fromList(List.filled(32, 7))),
      httpLogLevel: null,
    );
    final adapter = _RecordingAdapter();
    client.dio.httpClientAdapter = adapter;
    return (client, adapter);
  }

  test('Client signs its X-Request-Id as the token jti', () async {
    final (c, adapter) = client();
    await c.dio.get<dynamic>('/me');

    final headers = adapter.request!.headers;
    final requestId = headers['X-Request-Id'] as String;
    expect(requestId, isNotEmpty);
    expect(_jti(headers['Authorization'] as String), requestId);
  });

  test('Client keeps an X-Request-Id set by the caller', () async {
    final (c, adapter) = client();
    await c.dio.get<dynamic>(
      '/me',
      options: Options(headers: {'X-Request-Id': 'request-1'}),
    );

    final headers = adapter.request!.headers;
    expect(headers['X-Request-Id'], 'request-1');
    expect(_jti(headers['Authorization'] as String), 'request-1');
  });

  test('Each request gets its own X-Request-Id', () async {
    final (c, adapter) = client();
    await c.dio.get<dynamic>('/me');
    final first = adapter.request!.headers['X-Request-Id'];
    await c.dio.get<dynamic>('/me');
    expect(adapter.request!.headers['X-Request-Id'], isNot(first));
  });
}
