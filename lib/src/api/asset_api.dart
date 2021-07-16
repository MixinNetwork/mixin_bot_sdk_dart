import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';
import '../vo/asset.dart';
import '../vo/asset_fee.dart';
import '../vo/pending_deposit.dart';

class AssetApi {
  AssetApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<List<Asset>>> getAssets() => MixinResponse.requestList(
        dio.get('/assets'),
        (json) => Asset.fromJson(json),
      );

  Future<MixinResponse<Asset>> getAssetById(String id) =>
      MixinResponse.request<Asset>(
        dio.get('/assets/$id'),
        (json) => Asset.fromJson(json),
      );

  Future<MixinResponse<AssetFee>> getAssetFee(String id) =>
      MixinResponse.request<AssetFee>(
        dio.get('/assets/$id/fee'),
        (json) => AssetFee.fromJson(json),
      );

  Future<MixinResponse<List<Asset>>> queryAsset(String query) =>
      MixinResponse.requestList(
        dio.get('/network/assets/search/$query'),
        (json) => Asset.fromJson(json),
      );

  Future<MixinResponse<List<PendingDeposit>>> pendingDeposits(String assetId,
          {String? destination, String? tag}) =>
      MixinResponse.requestList(
        dio.get('/external/transactions', queryParameters: {
          'asset': assetId,
          'destination': destination,
          'tag': tag,
        }),
        (json) => PendingDeposit.fromJson(json),
      );

  Future<MixinResponse<List<Asset>>> getTopAssets() =>
      MixinResponse.requestList(
        dio.get('/network/assets/top'),
        (json) => Asset.fromJson(json),
      );
}
