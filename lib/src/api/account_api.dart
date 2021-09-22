import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';
import '../vo/account.dart';
import '../vo/code_type_interface.dart';
import '../vo/fiat.dart';
import '../vo/mixin_response.dart';
import '../vo/request/account_request.dart';
import '../vo/request/logout_request.dart';
import '../vo/signal_key_count.dart';
import '../vo/sticker.dart';
import '../vo/sticker_albums.dart';
import '../vo/user.dart';

class AccountApi {
  AccountApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<Account>> getMe() => MixinResponse.request<Account>(
        dio.get('/me'),
        (json) => Account.fromJson(json),
      );

  Future<MixinResponse<Account>> update(AccountUpdateRequest request) =>
      MixinResponse.request<Account>(
        dio.post('/me', data: request),
        (json) => Account.fromJson(json),
      );

  Future<MixinResponse<List<User>>> getFriends() => MixinResponse.requestList(
        dio.get('/friends'),
        (json) => User.fromJson(json),
      );

  Future<MixinResponse<SignalKeyCount>> getSignalKeyCount() =>
      MixinResponse.request<SignalKeyCount>(
        dio.get('/signal/keys/count'),
        (json) => SignalKeyCount.fromJson(json),
      );

  Future<MixinResponse<void>> pushSignalKeys(
          Map<String, dynamic> signalKeysRequest) =>
      MixinResponse.requestVoid(
          dio.post('/signal/keys', data: signalKeysRequest));

  Future<MixinResponse<dynamic>> logout(LogoutRequest request) =>
      MixinResponse.request<dynamic>(
        dio.post('/logout', data: request),
        (json) => json,
      );

  Future<MixinResponse<List<StickerAlbum>>> getStickerAlbums() =>
      MixinResponse.requestList(
        dio.get('/stickers/albums'),
        (json) => StickerAlbum.fromJson(json),
      );

  Future<MixinResponse<List<Sticker>>> getStickersByAlbumId(String id) =>
      MixinResponse.requestList(
        dio.get('/stickers/albums/$id'),
        (json) => Sticker.fromJson(json),
      );

  Future<MixinResponse<Sticker>> getStickerById(String id) =>
      MixinResponse.request<Sticker>(
        dio.get('/stickers/$id'),
        (json) => Sticker.fromJson(json),
      );

  Future<MixinResponse<List<Fiat>>> getFiats() => MixinResponse.requestList(
        dio.get('/fiats'),
        (json) => Fiat.fromJson(json),
      );

  Future<MixinResponse<CodeTypeInterface?>> code(String id) =>
      MixinResponse.request<CodeTypeInterface?>(
        dio.get('/codes/$id'),
        (json) {
          try {
            final jsonObject = json as Map<String, dynamic>;
            final type = jsonObject['type'] as String;
            switch (type) {
              case 'user':
                return User.fromJson(json);
              case 'conversation':
                return ConversationResponse.fromJson(json);
            }
          } catch (_) {
            return null;
          }
        },
      );
}
