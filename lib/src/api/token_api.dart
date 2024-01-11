import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';

class TokenApi {
  TokenApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<List<Token>>> getAssets() =>
      MixinResponse.requestList<Token>(
        dio.get('/safe/assets'),
        Token.fromJson,
      );

  Future<MixinResponse<Token>> getAssetById(String id) =>
      MixinResponse.request<Token>(
        dio.get('/safe/assets/$id'),
        Token.fromJson,
      );

  Future<MixinResponse<List<AssetFee>>> getFees({
    required String asset,
    required String destination,
  }) =>
      MixinResponse.requestList<AssetFee>(
        dio.get(
          '/safe/assets/$asset/fee',
          queryParameters: {
            'destination': destination,
          },
        ),
        AssetFee.fromJson,
      );

  Future<MixinResponse<List<SafeSnapshot>>> getSnapshotsByAssetId(
    String id, {
    String? offset,
    int limit = 30,
  }) =>
      MixinResponse.requestList<SafeSnapshot>(
        dio.get('/safe/snapshots', queryParameters: <String, dynamic>{
          'asset': id,
          'offset': offset,
          'limit': limit,
        }),
        SafeSnapshot.fromJson,
      );

  Future<MixinResponse<List<SafeSnapshot>>> getAllSnapshots({
    String? offset,
    int limit = 30,
    String? opponent,
  }) =>
      MixinResponse.requestList<SafeSnapshot>(
        dio.get('/safe/snapshots', queryParameters: <String, dynamic>{
          'offset': offset,
          'limit': limit,
          'opponent': opponent,
        }),
        SafeSnapshot.fromJson,
      );

  Future<MixinResponse<List<SafeSnapshot>>> getSnapshots({
    required String assetId,
    String? offset,
    int limit = 30,
    String? opponent,
    String? destination,
    String? tag,
  }) =>
      MixinResponse.requestList<SafeSnapshot>(
        dio.get('/safe/snapshots', queryParameters: <String, dynamic>{
          'asset': assetId,
          'offset': offset,
          'limit': limit,
          'opponent': opponent,
          'destination': destination,
          'tag': tag,
        }),
        SafeSnapshot.fromJson,
      );

  Future<MixinResponse<SafeSnapshot>> getSnapshotById(String id) =>
      MixinResponse.request<SafeSnapshot>(
        dio.get('/safe/snapshots/$id'),
        SafeSnapshot.fromJson,
      );

  Future<MixinResponse<List<SafePendingDeposit>>> pendingDeposits(
    String assetId, {
    String? destination,
    String? tag,
  }) =>
      MixinResponse.requestList<SafePendingDeposit>(
        dio.get(
          '/safe/deposits',
          queryParameters: <String, dynamic>{
            'asset': assetId,
            'destination': destination,
            'tag': tag,
          },
        ),
        SafePendingDeposit.fromJson,
      );

  Future<MixinResponse<SafeSnapshot>> getTrace(String traceId) =>
      MixinResponse.request<SafeSnapshot>(
        dio.get('/safe/snapshots/trace/$traceId'),
        SafeSnapshot.fromJson,
      );
}
