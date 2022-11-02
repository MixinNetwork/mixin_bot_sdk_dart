import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';

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

  Future<MixinResponse<void>> logout(LogoutRequest request) =>
      MixinResponse.requestVoid(dio.post('/logout', data: request));

  Future<MixinResponse<List<StickerAlbum>>> getStickerAlbums() =>
      MixinResponse.requestList(
        dio.get('/stickers/albums'),
        (json) => StickerAlbum.fromJson(json),
      );

  Future<MixinResponse<StickerAlbum>> getStickerAlbum(String id) =>
      MixinResponse.request(
        dio.get('/albums/$id'),
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

  Future<MixinResponse<Sticker>> addSticker(StickerRequest request) =>
      MixinResponse.request<Sticker>(
        dio.post('/stickers/favorite/add', data: request),
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
            final jsonObject = json;
            final type = jsonObject['type'] as String;
            switch (type) {
              case 'user':
                return User.fromJson(json);
              case 'conversation':
                return ConversationResponse.fromJson(json);
              case 'non_fungible_request':
                return CollectibleRequest.fromJson(json);
              case 'multisig_request':
                return MultisigsResponse.fromJson(json);
              case 'authorization':
                return AuthorizationResponse.fromJson(json);
              case 'payment':
                return PaymentCodeResponse.fromJson(json);
            }
          } catch (_) {
            return null;
          }
          return null;
        },
      );

  Future<MixinResponse<VerificationResponse>> verification(
          VerificationRequest request) =>
      MixinResponse.request<VerificationResponse>(
        dio.post('/verifications', data: request),
        (json) => VerificationResponse.fromJson(json),
      );

  Future<MixinResponse<Account>> create(String id, AccountRequest request) =>
      MixinResponse.request<Account>(
        dio.post('/verifications/$id', data: request),
        (json) => Account.fromJson(json),
      );

  Future<MixinResponse<User>> verifyPin(String pin) =>
      MixinResponse.request<User>(
        dio.post('/pin/verify', data: PinRequest(pin: pin).toJson()),
        (json) => User.fromJson(json),
      );

  Future<MixinResponse<User>> createPin(String pin) =>
      MixinResponse.request<User>(
        dio.post('/pin/update', data: PinRequest(pin: pin)),
        (json) => User.fromJson(json),
      );

  Future<MixinResponse<Account>> updatePin(PinRequest request) =>
      MixinResponse.request<Account>(
        dio.post('/pin/update', data: request),
        (json) => Account.fromJson(json),
      );

  Future<MixinResponse<User>> createUsers(AccountRequest request) =>
      MixinResponse.request<User>(
        dio.post('/users', data: request),
        (json) => User.fromJson(json),
      );

  Future<MixinResponse<VerificationResponse>> deactiveVerification(
    String id,
    String code,
  ) =>
      MixinResponse.request<VerificationResponse>(
        dio.post('/verifications/$id', data: {
          'code': code,
          'purpose': VerificationPurpose.deactivated.name.toUpperCase(),
        }),
        (json) => VerificationResponse.fromJson(json),
      );

  Future<MixinResponse<void>> deactive(DeactivateRequest request) =>
      MixinResponse.requestVoid(dio.post('/me/deactivate', data: request));

  Future<MixinResponse<List<LogResponse>>> pinLogs({
    String? category,
    String? offset,
    int? limit,
  }) =>
      MixinResponse.requestList<LogResponse>(
        dio.get('/logs', queryParameters: {
          'category': category,
          'offset': offset,
          'limit': limit,
        }),
        (json) => LogResponse.fromJson(json),
      );
}
