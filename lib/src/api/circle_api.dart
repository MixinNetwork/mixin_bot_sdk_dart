import 'package:mixin_bot_sdk_dart/src/vo/circle_conversation.dart';
import 'package:mixin_bot_sdk_dart/src/vo/circle_conversation_request.dart';
import 'package:mixin_bot_sdk_dart/src/vo/circle_name.dart';
import 'package:mixin_bot_sdk_dart/src/vo/circle_response.dart';
import 'package:dio/dio.dart';

import '../vo/mixin_response.dart';

class CircleApi {
  final Dio dio;

  CircleApi({required this.dio});

  Future<MixinResponse<List<CircleResponse>>> getCircles() {
    return MixinResponse.request<List<CircleResponse>>(dio.get('/circles'));
  }

  Future<MixinResponse<CircleResponse>> getgetCircle(String id) {
    return MixinResponse.request<CircleResponse>(dio.get('/circles/$id'));
  }

  Future<MixinResponse<CircleResponse>> updateCircle(
      String id, CircleName circleName) {
    return MixinResponse.request<CircleResponse>(
        dio.post('/circles/$id', data: circleName));
  }

  Future<MixinResponse<dynamic>> deleteCircle(String id) {
    return MixinResponse.request<dynamic>(dio.post('/circles/$id/delete'));
  }

  Future<MixinResponse<dynamic>> updateCircleConversations(
      String id, List<CircleConversationRequest> conversationCircleRequests) {
    return MixinResponse.request<dynamic>(dio.post('/circles/$id/conversations',
        data: conversationCircleRequests));
  }

  Future<MixinResponse<List<CircleConversation>>> getCircleConversations(String id,
      {String? offset, int limit = 500}) {
    return MixinResponse.request<List<CircleConversation>>(dio.get(
        '/circles/$id/conversations',
        queryParameters: {'offset': offset, 'limit': limit}));
  }
}
