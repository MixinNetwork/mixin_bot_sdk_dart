import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mixin_bot_sdk_dart/src/api/attachment_api.dart';
import 'package:mixin_bot_sdk_dart/src/api/circle_api.dart';
import 'package:mixin_bot_sdk_dart/src/api/conversation_api.dart';

import '../mixin_bot_sdk_dart.dart';
import 'api/account_api.dart';
import 'api/circle_api.dart';
import 'api/message_api.dart';
import 'api/provisioning_api.dart';
import 'api/user_api.dart';
import 'auth.dart';
import 'error/mixin_api_error.dart';

class Client {
  Client({
    String? userId,
    String? sessionId,
    String? privateKey,
    String? scp,
    BaseOptions? dioOptions,
    JsonDecodeCallback? jsonDecodeCallback,
    Iterable<Interceptor> interceptors = const [],
    Level? level = Level.ALL,
  }) {
    _dio = Dio(dioOptions);
    _dio.options.baseUrl = 'https://api.mixin.one';
    _dio.options.responseType = ResponseType.json;
    (dio.transformer as DefaultTransformer).jsonDecodeCallback =
        jsonDecodeCallback;
    if (level != null || level != Level.NONE) {
      var printBody = level == Level.ALL || level == Level.BODY;
      var printHeader = level == Level.ALL || level == Level.HEADERS;
      _dio.interceptors.add(LogInterceptor(
        requestBody: printBody,
        responseBody: printBody,
        requestHeader: printHeader,
        responseHeader: printHeader,
      ));
    }
    _dio.interceptors.addAll(interceptors);
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (
        RequestOptions options,
        RequestInterceptorHandler handler,
      ) async {
        var body = '';
        if (options.data != null) {
          body = jsonEncode(options.data);
        }
        options.headers['Accept-Language'] ??= 'en_US';
        options.headers['Authorization'] = 'Bearer ' +
            signAuthTokenWithEdDSA(
              userId,
              sessionId,
              privateKey,
              scp,
              options.method,
              options.path,
              body,
            );
        handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        var error = response.data['error'];
        if (error == null) return handler.resolve(response);

        return handler.reject(
          MixinApiError(
            requestOptions: response.requestOptions,
            response: response,
            error: MixinError.fromJson(error),
          ),
          true,
        );
      },
    ));
    _userApi = UserApi(dio: _dio);
    _provisioningApi = ProvisioningApi(dio: _dio);
    _accountApi = AccountApi(dio: _dio);
    _conversationApi = ConversationApi(dio: _dio);
    _messageApi = MessageApi(dio: _dio);
    _attachmentApi = AttachmentApi(dio: _dio);
    _circleApi = CircleApi(dio: _dio);
  }

  late Dio _dio;
  late ProvisioningApi _provisioningApi;
  late UserApi _userApi;
  late ConversationApi _conversationApi;
  late MessageApi _messageApi;
  late AccountApi _accountApi;
  late AttachmentApi _attachmentApi;
  late CircleApi _circleApi;

  Dio get dio => _dio;

  AccountApi get accountApi => _accountApi;

  ConversationApi get conversationApi => _conversationApi;

  MessageApi get messageApi => _messageApi;

  UserApi get userApi => _userApi;

  ProvisioningApi get provisioningApi => _provisioningApi;

  AttachmentApi get attachmentApi => _attachmentApi;

  CircleApi get circleApi => _circleApi;
}

enum Level { NONE, BODY, HEADERS, ALL }
