import 'package:bot_api_dart_client/bot_api_dart_client.dart';
import 'package:bot_api_dart_client/src/vo/conversation_request.dart';
import 'package:dio/dio.dart';

import '../vo/mixin_response.dart';

class ConversationdApi {
  final Dio dio;

  ConversationdApi({this.dio});

  Future<Response<MixinResponse>> createConversation(
      ConversationRequest request) {
    return dio.post('/conversations', data: request);
  }

  Future<Response<MixinResponse>> getConversation(String id) {
    return dio.get<MixinResponse>('/conversations/$id');
  }

  Future<Response<MixinResponse>> updateConversation(String id) {
    return dio.get<MixinResponse>('/conversations/$id');
  }
}
