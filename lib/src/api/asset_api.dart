import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';

class AssetApi {
  AssetApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<List<Asset>>> getAssets() => MixinResponse.requestList(
        dio.get('/assets'),
        Asset.fromJson,
      );

  Future<MixinResponse<Asset>> getAssetById(String id) =>
      MixinResponse.request<Asset>(
        dio.get('/assets/$id'),
        Asset.fromJson,
      );

  Future<MixinResponse<AssetFee>> getAssetFee(String id) =>
      MixinResponse.request<AssetFee>(
        dio.get('/assets/$id/fee'),
        AssetFee.fromJson,
      );

  Future<MixinResponse<List<Asset>>> queryAsset(String query) =>
      MixinResponse.requestList(
        dio.get('/network/assets/search/$query'),
        Asset.fromJson,
      );

  Future<MixinResponse<List<PendingDeposit>>> pendingDeposits(String assetId,
          {String? destination, String? tag}) =>
      MixinResponse.requestList(
        dio.get('/external/transactions', queryParameters: <String, dynamic>{
          'asset': assetId,
          'destination': destination,
          'tag': tag,
        }),
        PendingDeposit.fromJson,
      );

  Future<MixinResponse<List<Asset>>> getTopAssets() =>
      MixinResponse.requestList(
        dio.get('/network/assets/top'),
        Asset.fromJson,
      );
}
