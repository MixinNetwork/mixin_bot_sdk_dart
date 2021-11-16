import 'package:dio/dio.dart';

enum HttpLogLevel { none, body, headers, all }

class MixinLogInterceptor extends Interceptor {
  MixinLogInterceptor(HttpLogLevel httpLogLevel)
      : _request = httpLogLevel != HttpLogLevel.none,
        _requestHeader = httpLogLevel == HttpLogLevel.all ||
            httpLogLevel == HttpLogLevel.headers,
        _responseHeader = httpLogLevel == HttpLogLevel.all ||
            httpLogLevel == HttpLogLevel.headers,
        _requestBody = httpLogLevel == HttpLogLevel.all ||
            httpLogLevel == HttpLogLevel.body,
        _responseBody = httpLogLevel == HttpLogLevel.all ||
            httpLogLevel == HttpLogLevel.body,
        _error = httpLogLevel != HttpLogLevel.none;

  // ignore: avoid_setters_without_getters
  set httpLogLevel(HttpLogLevel httpLogLevel) {
    _request = httpLogLevel != HttpLogLevel.none;
    _requestHeader = httpLogLevel == HttpLogLevel.all ||
        httpLogLevel == HttpLogLevel.headers;
    _responseHeader = httpLogLevel == HttpLogLevel.all ||
        httpLogLevel == HttpLogLevel.headers;
    _requestBody =
        httpLogLevel == HttpLogLevel.all || httpLogLevel == HttpLogLevel.body;
    _responseBody =
        httpLogLevel == HttpLogLevel.all || httpLogLevel == HttpLogLevel.body;
    _error = httpLogLevel != HttpLogLevel.none;
  }

  /// Print request [Options]
  bool _request;

  /// Print request header [Options.headers]
  bool _requestHeader;

  bool _requestBody;

  /// Print [Response.data]
  bool _responseBody;

  /// Print [Response.headers]
  bool _responseHeader;

  /// Print error message
  bool _error;

  /// Log printer; defaults print log to console.
  /// In flutter, you'd better use debugPrint.
  /// you can also write log in a file, for example:
  ///```dart
  ///  var file=File("./log.txt");
  ///  var sink=file.openWrite();
  ///  dio.interceptors.add(LogInterceptor(logPrint: sink.writeln));
  ///  ...
  ///  await sink.close();
  ///```
  static void Function(Object object) logPrint = print;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logPrint('*** Request ***');
    _printKV('uri', options.uri);
    //options.headers;

    if (_request) {
      _printKV('method', options.method);
      _printKV('responseType', options.responseType.toString());
      _printKV('followRedirects', options.followRedirects);
      _printKV('connectTimeout', options.connectTimeout);
      _printKV('sendTimeout', options.sendTimeout);
      _printKV('receiveTimeout', options.receiveTimeout);
      _printKV(
          'receiveDataWhenStatusError', options.receiveDataWhenStatusError);
      _printKV('extra', options.extra);
    }
    if (_requestHeader) {
      logPrint('headers:');
      options.headers.forEach((key, dynamic v) => _printKV(' $key', v));
    }
    if (_requestBody) {
      _printKV('data isEmpty', options.data?.toString().trim().isEmpty ?? true);
      logPrint('data:');
      _printAll(options.data);
    }
    logPrint('');

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logPrint('*** Response ***');
    _printResponse(response);
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (_error) {
      logPrint('*** DioError ***:');
      logPrint('uri: ${err.requestOptions.uri}');
      logPrint('$err');
      if (err.response != null) {
        _printResponse(err.response!);
      }
      logPrint('');
    }

    handler.next(err);
  }

  void _printResponse(Response response) {
    _printKV('uri', response.requestOptions.uri);
    if (_responseHeader) {
      _printKV('statusCode', response.statusCode);
      if (response.isRedirect == true) {
        _printKV('redirect', response.realUri);
      }

      logPrint('headers:');
      response.headers.forEach((key, v) => _printKV(' $key', v.join('\r\n\t')));
    }
    if (_responseBody) {
      final responseBodyString = response.toString();
      _printKV('Response Text isEmpty', responseBodyString.trim().isEmpty);
      logPrint('Response Text:');
      _printAll(responseBodyString);
    }
    logPrint('');
  }

  void _printKV(String key, Object? v) {
    logPrint('$key: $v');
  }

  void _printAll(dynamic msg) {
    msg.toString().split('\n').forEach(logPrint);
  }
}
