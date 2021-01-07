import 'dart:convert';

import 'package:mixin_bot_sdk_dart/src/api/conversation_api.dart';
import 'package:dio/dio.dart';

import 'api/account_api.dart';
import 'auth.dart';
import 'mixin.dart';
import 'api/provisioning_api.dart';
import 'api/user_api.dart';

class Client {
  Client({
    String userId,
    String sessionId,
    String privateKey,
    BaseOptions dioOptions,
  }) {
    _dio = Dio(dioOptions);
    _dio.options.baseUrl = 'https://api.mixin.one';
    _dio.options.connectTimeout ??= 10000;
    _dio.options.sendTimeout ??= 10000;
    _dio.options.receiveTimeout ??= 10000;
    _dio.options.responseType = ResponseType.json;
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      var body = '';
      if (options.data != null) {
        body = jsonEncode(options.data);
      }
      options.headers['Accept-Language'] ??= 'en_US';
      options.headers['Authorization'] = 'Bearer ' +
          signAuthTokenWithEdDSA(
            userId ?? _mixin?.userId,
            sessionId ?? _mixin?.sessionId,
            privateKey ?? _mixin?.privateKey,
            _mixin?.scp,
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

    _userApi = UserApi(dio: _dio);
    _provisioningApi = ProvisioningApi(dio: _dio);
    _accountApi = AccountApi(dio: _dio);
    _conversationApi = ConversationApi(dio: _dio);
  }

  Mixin _mixin;

  void initMixin(
    String userId,
    String sessionId,
    String privateKey,
    String scp,
  ) {
    Mixin.init(
        userId: userId, sessionId: sessionId, privateKey: privateKey, scp: scp);
    _mixin = Mixin();
  }

  Dio _dio;
  ProvisioningApi _provisioningApi;
  UserApi _userApi;
  ConversationApi _conversationApi;
  AccountApi _accountApi;

  Dio get dio => _dio;

  AccountApi get accountApi => _accountApi;

  ConversationApi get conversationApi => _conversationApi;

  UserApi get userApi => _userApi;

  ProvisioningApi get provisioningApi => _provisioningApi;
}
