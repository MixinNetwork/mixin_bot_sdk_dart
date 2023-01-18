import 'package:diox/diox.dart';

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
        (json) => CircleResponse.fromJson(json),
      );

  Future<MixinResponse<CircleResponse>> getCircle(String id) =>
      MixinResponse.request<CircleResponse>(
        dio.get('/circles/$id'),
        (json) => CircleResponse.fromJson(json),
      );

  Future<MixinResponse<CircleResponse>> createCircle(CircleName circleName) =>
      MixinResponse.request<CircleResponse>(
        dio.post('/circles', data: circleName),
        (json) => CircleResponse.fromJson(json),
      );

  Future<MixinResponse<CircleResponse>> updateCircle(
          String id, CircleName circleName) =>
      MixinResponse.request<CircleResponse>(
        dio.post('/circles/$id', data: circleName),
        (json) => CircleResponse.fromJson(json),
      );

  Future<MixinResponse<void>> deleteCircle(String id) =>
      MixinResponse.requestVoid(dio.post('/circles/$id/delete'));

  Future<MixinResponse<List<CircleConversation>>> updateCircleConversations(
          String id,
          List<CircleConversationRequest> conversationCircleRequests) =>
      MixinResponse.requestList(
        dio.post('/circles/$id/conversations',
            data: conversationCircleRequests),
        (json) => CircleConversation.fromJson(json),
      );

  Future<MixinResponse<List<CircleConversation>>> getCircleConversations(
          String id,
          {String? offset,
          int limit = 500}) =>
      MixinResponse.requestList(
        dio.get('/circles/$id/conversations?offset=$offset&limit=$limit'),
        (json) => CircleConversation.fromJson(json),
      );
}
