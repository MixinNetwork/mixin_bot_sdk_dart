import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';

class UserApi {
  UserApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<User>> getMe() => MixinResponse.request<User>(
        dio.get('/me'),
        User.fromJson,
      );

  Future<MixinResponse<User>> getUserById(String id) =>
      MixinResponse.request<User>(
        dio.get('/users/$id'),
        User.fromJson,
      );

  Future<MixinResponse<User>> search(String query) =>
      MixinResponse.request<User>(
        dio.get('/search/${Uri.encodeComponent(query)}'),
        User.fromJson,
      );

  Future<MixinResponse<List<User>>> getUsers(List<String> ids) =>
      MixinResponse.requestList(
        dio.post('/users/fetch', data: ids),
        User.fromJson,
      );

  Future<MixinResponse<User>> relationships(RelationshipRequest request) =>
      MixinResponse.request<User>(
        dio.post('/relationships', data: request),
        User.fromJson,
      );

  Future<MixinResponse<User>> report(RelationshipRequest request) =>
      MixinResponse.request<User>(
        dio.post('/reports', data: request),
        User.fromJson,
      );

  Future<MixinResponse<List<User>>> blockingUsers() =>
      MixinResponse.requestList(
        dio.get('/blocking_users'),
        User.fromJson,
      );

  Future<MixinResponse<List<UserSession>>> getSessions(List<String> ids) =>
      MixinResponse.requestList(
        dio.post('/sessions/fetch', data: ids),
        UserSession.fromJson,
      );

  Future<MixinResponse<List<FavoriteApp>>> getUserFavoriteApps(String userId) =>
      MixinResponse.requestList(
        dio.get('/users/$userId/apps/favorite'),
        FavoriteApp.fromJson,
      );

  Future<void> removeFavoriteApp(String appId) => MixinResponse.requestVoid(
        dio.post('/apps/$appId/unfavorite'),
      );

  /// Create Network Users. Only application user can create network users.
  ///
  /// [sessionSecret] Ed25519 Public Key in Base64
  /// [fullName] display name
  Future<MixinResponse<Account>> createUsers({
    required String fullName,
    required String sessionSecret,
  }) =>
      MixinResponse.request<Account>(
        dio.post(
          '/users',
          data: {
            'full_name': fullName,
            'session_secret': sessionSecret,
          },
        ),
        Account.fromJson,
      );
}
