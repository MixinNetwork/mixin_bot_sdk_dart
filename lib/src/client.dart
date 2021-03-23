import 'dart:convert';

import 'package:mixin_bot_sdk_dart/src/api/attachment_api.dart';
import 'package:mixin_bot_sdk_dart/src/api/circle_api.dart';
import 'package:mixin_bot_sdk_dart/src/api/conversation_api.dart';
import 'package:dio/dio.dart';

import 'api/account_api.dart';
import 'api/circle_api.dart';
import 'api/message_api.dart';
import 'auth.dart';
import 'api/provisioning_api.dart';
import 'api/user_api.dart';

class Client {
  Client({
    String? userId,
    String? sessionId,
    String? privateKey,
    String? scp,
    BaseOptions? dioOptions,
  }) {
    _dio = Dio(dioOptions);
    _dio.options.baseUrl = 'https://api.mixin.one';
    _dio.options.responseType = ResponseType.json;
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
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
      return options;
    }, onResponse: (Response response) async {
      print(response.data);
      return response;
    }, onError: (DioError error) async {
      return error;
    }));

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
