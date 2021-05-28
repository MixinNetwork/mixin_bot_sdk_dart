import 'package:dio/dio.dart';
import 'package:mixin_bot_sdk_dart/src/vo/asset.dart';

import '../../mixin_bot_sdk_dart.dart';

class AssetApi {
  AssetApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<Asset>> getAssetById(String id) =>
      MixinResponse.request<Asset>(dio.get('/assets/$id'));
}
