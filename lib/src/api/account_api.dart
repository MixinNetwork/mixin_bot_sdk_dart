import 'package:dio/dio.dart';

import '../vo/mixin_response.dart';
import '../vo/signal_key_count.dart';
import '../vo/user.dart';

class AccountApi {
  final Dio dio;

  AccountApi({this.dio});

  Future<MixinResponse<User>> getMe() =>
      MixinResponse.request<User>(dio.get('/me'));

  Future<MixinResponse<List<User>>> getFriends() =>
      MixinResponse.request<List<User>>(dio.get('/friends'));

  Future<MixinResponse<SignalKeyCount>> getSignalKeyCount() =>
      MixinResponse.request<SignalKeyCount>(dio.get('/signal/keys/count'));

  Future<MixinResponse<void>> logout() =>
      MixinResponse.request<void>(dio.get('/logout'));
}
