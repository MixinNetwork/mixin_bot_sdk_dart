import 'package:bot_api_dart_client/bot_api_dart_client.dart';
import 'package:bot_api_dart_client/src/vo/conversation_request.dart';
import 'package:bot_api_dart_client/src/vo/conversation_response.dart';
import 'package:dio/dio.dart';

import '../vo/mixin_response.dart';

class ConversationdApi {
  final Dio dio;

  ConversationdApi({this.dio});

  Future<MixinResponse<ConversationResponse>> createConversation(
      ConversationRequest request) {
    return MixinResponse.request<ConversationResponse>(
        dio.post('/conversations', data: request));
  }

  Future<MixinResponse<ConversationResponse>> getConversation(String id) {
    return MixinResponse.request<ConversationResponse>(
        dio.get('/conversations/$id'));
  }

  Future<MixinResponse<ConversationResponse>> updateConversation(String id) {
    return MixinResponse.request<ConversationResponse>(
        dio.get('/conversations/$id'));
  }
}
