import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';
import '../vo/conversation_response.dart';
import '../vo/mixin_response.dart';
import '../vo/request/conversation_request.dart';

class ConversationApi {
  ConversationApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<ConversationResponse>> createConversation(
          ConversationRequest request) =>
      MixinResponse.request<ConversationResponse>(
          dio.post('/conversations', data: request));

  Future<MixinResponse<ConversationResponse>> update(
          String conversationId, ConversationRequest request) =>
      MixinResponse.request<ConversationResponse>(
          dio.post('/conversations/$conversationId', data: request));

  Future<MixinResponse<ConversationResponse>> exit(String conversationId) =>
      MixinResponse.request<ConversationResponse>(
          dio.post('/conversations/$conversationId/exit'));

  Future<MixinResponse<ConversationResponse>> getConversation(String id) =>
      MixinResponse.request<ConversationResponse>(
          dio.get('/conversations/$id'));

  Future<MixinResponse<ConversationResponse>> updateConversation(String id) =>
      MixinResponse.request<ConversationResponse>(
          dio.get('/conversations/$id'));

  Future<MixinResponse<ConversationResponse>> participants(
          String id, String action, List<ParticipantRequest> requests) =>
      MixinResponse.request<ConversationResponse>(
          dio.post('/conversations/$id/participants/$action', data: requests));

  Future<MixinResponse<ConversationResponse>> mute(
          String id, ConversationRequest request) =>
      MixinResponse.request<ConversationResponse>(
          dio.post('/conversations/$id/mute', data: request));

  Future<MixinResponse<ConversationResponse>> rotate(String id) =>
      MixinResponse.request<ConversationResponse>(
          dio.post('/conversations/$id/rotate'));
}
