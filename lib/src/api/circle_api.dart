import 'package:dio/dio.dart';

import '../vo/circle_conversation.dart';
import '../vo/circle_conversation_request.dart';
import '../vo/circle_name.dart';
import '../vo/circle_response.dart';
import '../vo/mixin_response.dart';

class CircleApi {
  CircleApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<List<CircleResponse>>> getCircles() =>
      MixinResponse.request<List<CircleResponse>>(dio.get('/circles'));

  Future<MixinResponse<CircleResponse>> getCircle(String id) =>
      MixinResponse.request<CircleResponse>(dio.get('/circles/$id'));

  Future<MixinResponse<CircleResponse>> createCircle(CircleName circleName) =>
      MixinResponse.request<CircleResponse>(
          dio.post('/circles', data: circleName));

  Future<MixinResponse<CircleResponse>> updateCircle(
          String id, CircleName circleName) =>
      MixinResponse.request<CircleResponse>(
          dio.post('/circles/$id', data: circleName));

  Future<MixinResponse<dynamic>> deleteCircle(String id) =>
      MixinResponse.request<dynamic>(dio.post('/circles/$id/delete'));

  Future<MixinResponse<List<CircleConversation>>> updateCircleConversations(
          String id,
          List<CircleConversationRequest> conversationCircleRequests) =>
      MixinResponse.request<List<CircleConversation>>(dio.post(
          '/circles/$id/conversations',
          data: conversationCircleRequests));

  Future<MixinResponse<List<CircleConversation>>> getCircleConversations(
          String id,
          {String? offset,
          int limit = 500}) =>
      MixinResponse.request<List<CircleConversation>>(
          dio.get('/circles/$id/conversations?offset=$offset&limit=$limit'));
}
