import 'package:bot_api_dart_client/bot_api_dart_client.dart';
import 'package:bot_api_dart_client/src/vo/relationship_request.dart';
import 'package:dio/dio.dart';

import '../vo/mixin_response.dart';

class UserApi {
  final Dio dio;

  UserApi({this.dio});

  Future<Response<MixinResponse>> getMe() {
    return dio.get<MixinResponse>('/me');
  }

  Future<Response<MixinResponse>> getUserById(String id) {
    return dio.get<MixinResponse>('/users/$id');
  }

  Future<Response<MixinResponse>> getUsers(List<String> ids) {
    return dio.post('/users/fetch', data: ids);
  }

  Future<Response<MixinResponse>> relationships(RelationshipRequest request) {
    return dio.post('/relationships', data: request);
  }

  Future<Response<MixinResponse>> report(RelationshipRequest request) {
    return dio.post('/reports', data: request);
  }

  Future<Response<MixinResponse>> blockingUsers() {
    return dio.get<MixinResponse>('/blocking_users');
  }

  Future<Response<MixinResponse>> getSessions(List<String> ids) {
    return dio.post('/sessions/fetch', data: ids);
  }
}
