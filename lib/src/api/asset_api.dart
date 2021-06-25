import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';
import '../vo/asset.dart';
import '../vo/asset_fee.dart';
import '../vo/pending_deposit.dart';

class AssetApi {
  AssetApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<List<Asset>>> getAssets() =>
      MixinResponse.request<List<Asset>>(dio.get('/assets'));

  Future<MixinResponse<Asset>> getAssetById(String id) =>
      MixinResponse.request<Asset>(dio.get('/assets/$id'));

  Future<MixinResponse<AssetFee>> getAssetFee(String id) =>
      MixinResponse.request<AssetFee>(dio.get('/assets/$id/fee'));

  Future<MixinResponse<List<Asset>>> queryAsset(String query) =>
      MixinResponse.request<List<Asset>>(
          dio.get('/network/assets/search/$query'));

  Future<MixinResponse<List<PendingDeposit>>> pendingDeposits(String assetId,
          {String? destination, String? tag}) =>
      MixinResponse.request<List<PendingDeposit>>(
          dio.get('/external/transactions', queryParameters: {
        'asset': assetId,
        'destination': destination,
        'tag': tag,
      }));

  Future<MixinResponse<List<Asset>>> getTopAssets() =>
      MixinResponse.request<List<Asset>>(dio.get('/network/assets/top'));
}
