import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';

class CollectibleApi {
  CollectibleApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<List<CollectibleOutput>>> getOutputs({
    required String members,
    required int threshold,
    String? state,
    String? offset,
    int limit = 500,
  }) =>
      MixinResponse.requestList<CollectibleOutput>(
        dio.get(
          '/collectibles/outputs',
          queryParameters: <String, dynamic>{
            'state': state,
            'offset': offset,
            'limit': limit,
            'members': members,
            'threshold': threshold,
          },
        ),
        (json) => CollectibleOutput.fromJson(json),
      );

  Future<MixinResponse<CollectibleToken>> getToken(String tokenId) =>
      MixinResponse.request<CollectibleToken>(
        dio.get('/collectibles/tokens/$tokenId'),
        (json) => CollectibleToken.fromJson(json),
      );

  Future<MixinResponse<CollectibleCollection>> collections(
          String collectionId) =>
      MixinResponse.request<CollectibleCollection>(
        dio.get('/collectibles/collections/$collectionId'),
        (json) => CollectibleCollection.fromJson(json),
      );
}
