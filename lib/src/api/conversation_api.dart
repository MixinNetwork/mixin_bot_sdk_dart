import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:mixin_bot_sdk_dart/src/vo/conversation_request.dart';
import 'package:mixin_bot_sdk_dart/src/vo/conversation_response.dart';
import 'package:dio/dio.dart';

import '../vo/mixin_response.dart';

class ConversationApi {
  final Dio dio;

  ConversationApi({required this.dio});

  Future<MixinResponse<ConversationResponse>> createConversation(
      ConversationRequest request) {
    return MixinResponse.request<ConversationResponse>(
        dio.post('/conversations', data: request));
  }

  Future<MixinResponse<ConversationResponse>> update(
      String conversationId, ConversationRequest request) {
    return MixinResponse.request<ConversationResponse>(
        dio.post('/conversations/$conversationId', data: request));
  }

  Future<MixinResponse<ConversationResponse>> exit(String conversationId) {
    return MixinResponse.request<ConversationResponse>(
        dio.post('/conversations/$conversationId/exit'));
  }

  Future<MixinResponse<ConversationResponse>> getConversation(String id) {
    return MixinResponse.request<ConversationResponse>(
        dio.get('/conversations/$id'));
  }

  Future<MixinResponse<ConversationResponse>> updateConversation(String id) {
    return MixinResponse.request<ConversationResponse>(
        dio.get('/conversations/$id'));
  }

  Future<MixinResponse<ConversationResponse>> participants(
      String id, String action, List<ParticipantRequest> requests) {
    return MixinResponse.request<ConversationResponse>(
        dio.post('/conversations/$id/participants/$action', data: requests));
  }

  Future<MixinResponse<ConversationResponse>> mute(
      String id, ConversationRequest request) {
    return MixinResponse.request<ConversationResponse>(
        dio.post('/conversations/$id/mute', data: request));
  }

  Future<MixinResponse<ConversationResponse>> rotate(String id) {
    return MixinResponse.request<ConversationResponse>(
        dio.post('/conversations/$id/rotate'));
  }
}
