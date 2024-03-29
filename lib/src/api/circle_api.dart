import 'package:dio/dio.dart';

import '../vo/circle_conversation.dart';
import '../vo/circle_name.dart';
import '../vo/circle_response.dart';
import '../vo/mixin_response.dart';
import '../vo/request/circle_conversation_request.dart';

class CircleApi {
  CircleApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<List<CircleResponse>>> getCircles() =>
      MixinResponse.requestList(
        dio.get('/circles'),
        CircleResponse.fromJson,
      );

  Future<MixinResponse<CircleResponse>> getCircle(String id) =>
      MixinResponse.request<CircleResponse>(
        dio.get('/circles/$id'),
        CircleResponse.fromJson,
      );

  Future<MixinResponse<CircleResponse>> createCircle(CircleName circleName) =>
      MixinResponse.request<CircleResponse>(
        dio.post('/circles', data: circleName),
        CircleResponse.fromJson,
      );

  Future<MixinResponse<CircleResponse>> updateCircle(
          String id, CircleName circleName) =>
      MixinResponse.request<CircleResponse>(
        dio.post('/circles/$id', data: circleName),
        CircleResponse.fromJson,
      );

  Future<MixinResponse<void>> deleteCircle(String id) =>
      MixinResponse.requestVoid(dio.post('/circles/$id/delete'));

  Future<MixinResponse<List<CircleConversation>>> updateCircleConversations(
          String id,
          List<CircleConversationRequest> conversationCircleRequests) =>
      MixinResponse.requestList(
        dio.post('/circles/$id/conversations',
            data: conversationCircleRequests),
        CircleConversation.fromJson,
      );

  Future<MixinResponse<List<CircleConversation>>> getCircleConversations(
          String id,
          {String? offset,
          int limit = 500}) =>
      MixinResponse.requestList(
        dio.get('/circles/$id/conversations?offset=$offset&limit=$limit'),
        CircleConversation.fromJson,
      );
}
