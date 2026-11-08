import 'package:dio/dio.dart';
import 'package:mixin_bot_sdk_dart/src/log_interceptor.dart';
import 'package:test/test.dart';

void main() {
  final logs = <Object>[];
  setUp(() {
    logs.clear();
    MixinLogInterceptor.logPrint = logs.add;
  });
  tearDown(() => MixinLogInterceptor.logPrint = print);

  final options = RequestOptions(
    path: 'https://example.com/me',
    headers: {'Authorization': 'Bearer secret-token'},
  );

  void run(HttpLogLevel level) {
    MixinLogInterceptor(level)
      ..onRequest(options, RequestInterceptorHandler())
      ..onResponse(
        Response<dynamic>(requestOptions: options, statusCode: 200),
        ResponseInterceptorHandler(),
      );
  }

  test('level none prints nothing', () {
    run(HttpLogLevel.none);
    expect(logs, isEmpty);
  });

  test('headers redact Authorization', () {
    run(HttpLogLevel.headers);
    expect(logs, contains(' Authorization: <redacted>'));
    expect(logs.join('\n'), isNot(contains('secret-token')));
  });
}
