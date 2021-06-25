import 'package:dio/dio.dart';

import '../vo/account.dart';
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

  Future<MixinResponse<Account>> getMe() =>
      MixinResponse.request<Account>(dio.get('/me'));

  Future<MixinResponse<Account>> update(AccountUpdateRequest request) =>
      MixinResponse.request<Account>(dio.post('/me', data: request));

  Future<MixinResponse<List<User>>> getFriends() =>
      MixinResponse.request<List<User>>(dio.get('/friends'));

  Future<MixinResponse<SignalKeyCount>> getSignalKeyCount() =>
      MixinResponse.request<SignalKeyCount>(dio.get('/signal/keys/count'));

  Future<MixinResponse<void>> pushSignalKeys(
          Map<String, dynamic> signalKeysRequest) =>
      MixinResponse.request(dio.post('/signal/keys', data: signalKeysRequest));

  Future<MixinResponse<dynamic>> logout(LogoutRequest request) =>
      MixinResponse.request<dynamic>(dio.post('/logout', data: request));

  Future<MixinResponse<List<StickerAlbum>>> getStickerAlbums() =>
      MixinResponse.request<List<StickerAlbum>>(dio.get('/stickers/albums'));

  Future<MixinResponse<List<Sticker>>> getStickersByAlbumId(String id) =>
      MixinResponse.request<List<Sticker>>(dio.get('/stickers/albums/$id'));

  Future<MixinResponse<Sticker>> getStickerById(String id) =>
      MixinResponse.request<Sticker>(dio.get('/stickers/$id'));

  Future<MixinResponse<List<Fiat>>> getFiats() =>
      MixinResponse.request<List<Fiat>>(dio.get('/fiats'));
}
