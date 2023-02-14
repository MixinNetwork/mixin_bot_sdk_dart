import 'package:dio/dio.dart';

import '../vo/favorite_app.dart';
import '../vo/mixin_response.dart';
import '../vo/request/relationship_request.dart';
import '../vo/user.dart';
import '../vo/user_session.dart';

class UserApi {
  UserApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<User>> getMe() => MixinResponse.request<User>(
        dio.get('/me'),
        (json) => User.fromJson(json),
      );

  Future<MixinResponse<User>> getUserById(String id) =>
      MixinResponse.request<User>(
        dio.get('/users/$id'),
        (json) => User.fromJson(json),
      );

  Future<MixinResponse<User>> search(String query) =>
      MixinResponse.request<User>(
        dio.get('/search/$query'),
        (json) => User.fromJson(json),
      );

  Future<MixinResponse<List<User>>> getUsers(List<String> ids) =>
      MixinResponse.requestList(
        dio.post('/users/fetch', data: ids),
        (json) => User.fromJson(json),
      );

  Future<MixinResponse<User>> relationships(RelationshipRequest request) =>
      MixinResponse.request<User>(
        dio.post('/relationships', data: request),
        (json) => User.fromJson(json),
      );

  Future<MixinResponse<User>> report(RelationshipRequest request) =>
      MixinResponse.request<User>(
        dio.post('/reports', data: request),
        (json) => User.fromJson(json),
      );

  Future<MixinResponse<List<User>>> blockingUsers() =>
      MixinResponse.requestList(
        dio.get('/blocking_users'),
        (json) => User.fromJson(json),
      );

  Future<MixinResponse<List<UserSession>>> getSessions(List<String> ids) =>
      MixinResponse.requestList(
        dio.post('/sessions/fetch', data: ids),
        (json) => UserSession.fromJson(json),
      );

  Future<MixinResponse<List<FavoriteApp>>> getUserFavoriteApps(String userId) =>
      MixinResponse.requestList(
        dio.get('/users/$userId/apps/favorite'),
        (json) => FavoriteApp.fromJson(json),
      );

  Future<void> removeFavoriteApp(String appId) => MixinResponse.requestVoid(
        dio.post('/apps/$appId/unfavorite'),
      );
}
