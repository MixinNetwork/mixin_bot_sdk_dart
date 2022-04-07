import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';

class ConversationApi {
  ConversationApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<ConversationResponse>> createConversation(
          ConversationRequest request) =>
      MixinResponse.request<ConversationResponse>(
        dio.post('/conversations', data: request),
        (json) => ConversationResponse.fromJson(json),
      );

  Future<MixinResponse<ConversationResponse>> update(
          String conversationId, ConversationRequest request) =>
      MixinResponse.request<ConversationResponse>(
        dio.post('/conversations/$conversationId', data: request),
        (json) => ConversationResponse.fromJson(json),
      );

  Future<MixinResponse<void>> exit(String conversationId) =>
      MixinResponse.requestVoid(
          dio.post('/conversations/$conversationId/exit'));

  Future<MixinResponse<ConversationResponse>> getConversation(String id) =>
      MixinResponse.request<ConversationResponse>(
        dio.get('/conversations/$id'),
        (json) => ConversationResponse.fromJson(json),
      );

  Future<MixinResponse<ConversationResponse>> updateConversation(String id) =>
      MixinResponse.request<ConversationResponse>(
        dio.get('/conversations/$id'),
        (json) => ConversationResponse.fromJson(json),
      );

  Future<MixinResponse<ConversationResponse>> participants(
          String id, String action, List<ParticipantRequest> requests) =>
      MixinResponse.request<ConversationResponse>(
        dio.post('/conversations/$id/participants/$action', data: requests),
        (json) => ConversationResponse.fromJson(json),
      );

  Future<MixinResponse<ConversationResponse>> mute(
          String id, ConversationRequest request) =>
      MixinResponse.request<ConversationResponse>(
        dio.post('/conversations/$id/mute', data: request),
        (json) => ConversationResponse.fromJson(json),
      );

  Future<MixinResponse<ConversationResponse>> rotate(String id) =>
      MixinResponse.request<ConversationResponse>(
        dio.post('/conversations/$id/rotate'),
        (json) => ConversationResponse.fromJson(json),
      );

  Future<MixinResponse<ConversationResponse>> join(String id) =>
      MixinResponse.request(
        dio.post('/conversations/$id/join'),
        (json) => ConversationResponse.fromJson(json),
      );

  Future<MixinResponse<ConversationResponse>> disappear(String id, ConversationRequest request) =>
      MixinResponse.request<ConversationResponse>(
        dio.post('/conversations/$id/disappear', data: request),
        (json) => ConversationResponse.fromJson(json),
      );

}
