import 'dart:convert';

import 'package:dio/dio.dart';

import '../mixin_bot_sdk_dart.dart';

const mixinBaseUrl0 = 'https://api.mixin.one';

class Client {
  Client({
    String? userId,
    String? sessionId,
    Key? sessionPrivateKey,
    String? scp,
    String? baseUrl,
    String? accessToken,
    BaseOptions? dioOptions,
    JsonDecodeCallback? jsonDecodeCallback,
    Iterable<Interceptor> interceptors = const [],
    HttpLogLevel? httpLogLevel = HttpLogLevel.all,
  }) {
    _dio = Dio(dioOptions);
    _dio.options.baseUrl = baseUrl ?? mixinBaseUrl0;
    _dio.options.responseType = ResponseType.json;
    _dio.options.contentType = Headers.jsonContentType;
    final transformer = dio.transformer;
    if (transformer is SyncTransformer && jsonDecodeCallback != null) {
      transformer.jsonDecodeCallback = jsonDecodeCallback;
    }
    _dio.interceptors.addAll(interceptors);
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (
        options,
        handler,
      ) async {
        var body = '';
        if (options.data != null) {
          body = jsonEncode(options.data);
        }

        final authToken = accessToken ??
            signAuthTokenWithEdDSA(
              userId,
              sessionId,
              sessionPrivateKey,
              scp,
              options.method,
              options.uri.toString().substring(options.baseUrl.length),
              body,
            );
        options.headers['Authorization'] = 'Bearer $authToken';
        handler.next(options);
      },
      onResponse: (response, handler) {
        final dynamic error = (response.data as Map)['error'];
        if (error == null) return handler.next(response);

        return handler.reject(
          MixinApiError(
            requestOptions: response.requestOptions,
            response: response,
            error: MixinError.fromJson(error as Map<String, dynamic>),
          ),
          true,
        );
      },
    ));
    if (httpLogLevel != null) {
      _dio.interceptors.add(MixinLogInterceptor(httpLogLevel));
    }
    _userApi = UserApi(dio: _dio);
    _provisioningApi = ProvisioningApi(dio: _dio);
    _accountApi = AccountApi(dio: _dio);
    _conversationApi = ConversationApi(dio: _dio);
    _messageApi = MessageApi(dio: _dio);
    _attachmentApi = AttachmentApi(dio: _dio);
    _circleApi = CircleApi(dio: _dio);
    _assetApi = AssetApi(dio: _dio);
    _tokenApi = TokenApi(dio: _dio);
    _oauthApi = OauthApi(dio: dio);
    _snapshotApi = SnapshotApi(dio: dio);
    _transferApi = TransferApi(dio: dio);
    _addressApi = AddressApi(dio: dio);
    _multisigApi = MultisigApi(dio: dio);
    _collectibleApi = CollectibleApi(dio: dio);
    _outputApi = OutputApi(dio: dio);
    _utxoApi = UtxoApi(accountApi, _tokenApi, dio: dio);
  }

  late Dio _dio;
  late ProvisioningApi _provisioningApi;
  late UserApi _userApi;
  late ConversationApi _conversationApi;
  late MessageApi _messageApi;
  late AccountApi _accountApi;
  late AttachmentApi _attachmentApi;
  late CircleApi _circleApi;
  late AssetApi _assetApi;
  late TokenApi _tokenApi;
  late OauthApi _oauthApi;
  late SnapshotApi _snapshotApi;
  late TransferApi _transferApi;
  late AddressApi _addressApi;
  late MultisigApi _multisigApi;
  late CollectibleApi _collectibleApi;
  late OutputApi _outputApi;
  late UtxoApi _utxoApi;

  Dio get dio => _dio;

  AccountApi get accountApi => _accountApi;

  ConversationApi get conversationApi => _conversationApi;

  MessageApi get messageApi => _messageApi;

  UserApi get userApi => _userApi;

  ProvisioningApi get provisioningApi => _provisioningApi;

  AttachmentApi get attachmentApi => _attachmentApi;

  CircleApi get circleApi => _circleApi;

  AssetApi get assetApi => _assetApi;

  TokenApi get tokenApi => _tokenApi;

  OauthApi get oauthApi => _oauthApi;

  SnapshotApi get snapshotApi => _snapshotApi;

  @Deprecated('mixin has migrated to safe, use utxoApi instead.')
  TransferApi get transferApi => _transferApi;

  AddressApi get addressApi => _addressApi;

  MultisigApi get multisigApi => _multisigApi;

  CollectibleApi get collectibleApi => _collectibleApi;

  OutputApi get outputApi => _outputApi;

  UtxoApi get utxoApi => _utxoApi;
}
