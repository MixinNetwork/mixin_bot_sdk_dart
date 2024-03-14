import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';

class AccountApi {
  AccountApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<Account>> getMe() => MixinResponse.request<Account>(
        dio.get('/me'),
        Account.fromJson,
      );

  Future<MixinResponse<Account>> update(AccountUpdateRequest request) =>
      MixinResponse.request<Account>(
        dio.post('/me', data: request),
        Account.fromJson,
      );

  Future<MixinResponse<Account>> preferences(AccountUpdateRequest request) =>
      MixinResponse.request<Account>(
        dio.post('/me/preferences', data: request),
        Account.fromJson,
      );

  Future<MixinResponse<List<User>>> getFriends() => MixinResponse.requestList(
        dio.get('/friends'),
        User.fromJson,
      );

  Future<MixinResponse<SignalKeyCount>> getSignalKeyCount() =>
      MixinResponse.request<SignalKeyCount>(
        dio.get('/signal/keys/count'),
        SignalKeyCount.fromJson,
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
        StickerAlbum.fromJson,
      );

  Future<MixinResponse<StickerAlbum>> getStickerAlbum(String id) =>
      MixinResponse.request(
        dio.get('/albums/$id'),
        StickerAlbum.fromJson,
      );

  Future<MixinResponse<List<Sticker>>> getStickersByAlbumId(String id) =>
      MixinResponse.requestList(
        dio.get('/stickers/albums/$id'),
        Sticker.fromJson,
      );

  Future<MixinResponse<Sticker>> getStickerById(String id) =>
      MixinResponse.request<Sticker>(
        dio.get('/stickers/$id'),
        Sticker.fromJson,
      );

  Future<MixinResponse<Sticker>> addSticker(StickerRequest request) =>
      MixinResponse.request<Sticker>(
        dio.post('/stickers/favorite/add', data: request),
        Sticker.fromJson,
      );

  Future<MixinResponse<void>> removeSticker(List<String> ids) =>
      MixinResponse.requestVoid(
        dio.post('/stickers/favorite/remove', data: ids),
      );

  Future<MixinResponse<List<Fiat>>> getFiats() => MixinResponse.requestList(
        dio.get('/fiats'),
        Fiat.fromJson,
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
        VerificationResponse.fromJson,
      );

  Future<MixinResponse<Account>> create(String id, AccountRequest request) =>
      MixinResponse.request<Account>(
        dio.post('/verifications/$id', data: request),
        Account.fromJson,
      );

  Future<MixinResponse<User>> verifyPin(
    String pin, {
    int? timestamp,
  }) =>
      MixinResponse.request<User>(
        dio.post(
          '/pin/verify',
          data: PinRequest(
            pin: pin,
            timestamp: timestamp,
          ).toJson(),
        ),
        User.fromJson,
      );

  Future<MixinResponse<User>> createPin(String pin) =>
      MixinResponse.request<User>(
        dio.post('/pin/update', data: PinRequest(pin: pin)),
        User.fromJson,
      );

  Future<MixinResponse<Account>> updatePin(PinRequest request) =>
      MixinResponse.request<Account>(
        dio.post('/pin/update', data: request.toJson()),
        Account.fromJson,
      );

  @Deprecated('use userApi#createUser')
  Future<MixinResponse<User>> createUsers(AccountRequest request) =>
      MixinResponse.request<User>(
        dio.post('/users', data: request),
        User.fromJson,
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
        VerificationResponse.fromJson,
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
        LogResponse.fromJson,
      );

  Future<MixinResponse<List<String>>> getExternalSchemes() =>
      MixinResponse.request<List<String>>(
        dio.get('/external/schemes'),
        (json) => List<String>.from(json as List<dynamic>),
      );

  Future<MixinResponse<AddressFee>> getExternalAddressFee({
    required String assetId,
    required String destination,
    String? tag,
  }) =>
      MixinResponse.request<AddressFee>(
        dio.get('/external/addresses/check', queryParameters: {
          'asset': assetId,
          'destination': destination,
          'tag': tag,
        }),
        AddressFee.fromJson,
      );

  Future<Account> updateTipPin({
    required String legacyPin,
    required String pinTokenBase64,
    required String sessionKeyBase64,
    required String tipPublicKeyHex,
  }) async {
    final iterator = DateTime.now().millisecondsSinceEpoch * 1000000;
    var encryptedLegacyPin = '';
    if (legacyPin.isNotEmpty) {
      encryptedLegacyPin = encryptPin(
        legacyPin,
        pinTokenBase64,
        sessionKeyBase64,
        iterator,
      );
    }
    final tipPublicKey = hex.decode(tipPublicKeyHex);
    if (tipPublicKey.length != 32) {
      throw ArgumentError(
          'Invalid tip public key size: ${tipPublicKey.length}');
    }
    const pinSuffix = [0, 0, 0, 0, 0, 0, 0, 1];
    final newEncryptedPin = encryptBytesPin(
      pinTokenBase64: pinTokenBase64,
      privateKeyBase64: sessionKeyBase64,
      target: Uint8List.fromList(tipPublicKey + pinSuffix),
      iterator: iterator + 1,
    );

    final data = await updatePin(PinRequest(
      pin: newEncryptedPin,
      oldPin: encryptedLegacyPin,
    ));
    return data.data;
  }
}
