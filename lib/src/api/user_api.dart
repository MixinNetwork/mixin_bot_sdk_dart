import 'package:bot_api_dart_client/bot_api_dart_client.dart';
import 'package:bot_api_dart_client/src/vo/relationship_request.dart';
import 'package:dio/dio.dart';

import '../vo/mixin_response.dart';

class UserApi {
  final Dio dio;

  UserApi({this.dio});

  Future<MixinResponse<User>> getMe() {
    return MixinResponse.request<User>(dio.get('/me'));
  }

  Future<MixinResponse<User>> getUserById(String id) {
    return MixinResponse.request<User>(dio.get('/users/$id'));
  }

  Future<MixinResponse<List<User>>> getUsers(List<String> ids) {
    return MixinResponse.request<List<User>>(
        dio.post('/users/fetch', data: ids));
  }

  Future<MixinResponse<User>> relationships(RelationshipRequest request) {
    return MixinResponse.request<User>(
        dio.post('/relationships', data: request));
  }

  Future<MixinResponse<User>> report(RelationshipRequest request) {
    return MixinResponse.request<User>(dio.post('/reports', data: request));
  }

  Future<MixinResponse<List<User>>> blockingUsers() {
    return MixinResponse.request<List<User>>(dio.get('/blocking_users'));
  }

  Future<MixinResponse<List>> getSessions(List<String> ids) {
    return MixinResponse.request<List<UserSession>>(
        dio.post('/sessions/fetch', data: ids));
  }
}
