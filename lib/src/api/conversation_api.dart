import 'package:mixin_bot_sdk_dart/src/vo/conversation_request.dart';
import 'package:mixin_bot_sdk_dart/src/vo/conversation_response.dart';
import 'package:dio/dio.dart';

import '../vo/mixin_response.dart';

class ConversationApi {
  final Dio dio;

  ConversationApi({this.dio});

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
