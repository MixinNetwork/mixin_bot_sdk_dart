import 'package:dio/dio.dart';

import '../vo/mixin_response.dart';
import '../vo/relationship_request.dart';
import '../vo/user.dart';
import '../vo/user_session.dart';

class UserApi {
  UserApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<User>> getMe() =>
      MixinResponse.request<User>(dio.get('/me'));

  Future<MixinResponse<User>> getUserById(String id) =>
      MixinResponse.request<User>(dio.get('/users/$id'));

  Future<MixinResponse<List<User>>> getUsers(List<String> ids) =>
      MixinResponse.request<List<User>>(dio.post('/users/fetch', data: ids));

  Future<MixinResponse<User>> relationships(RelationshipRequest request) =>
      MixinResponse.request<User>(dio.post('/relationships', data: request));

  Future<MixinResponse<User>> report(RelationshipRequest request) =>
      MixinResponse.request<User>(dio.post('/reports', data: request));

  Future<MixinResponse<List<User>>> blockingUsers() =>
      MixinResponse.request<List<User>>(dio.get('/blocking_users'));

  Future<MixinResponse<List<UserSession>>> getSessions(List<String> ids) =>
      MixinResponse.request<List<UserSession>>(
          dio.post('/sessions/fetch', data: ids));
}
