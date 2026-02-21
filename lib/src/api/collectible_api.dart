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
  }) => MixinResponse.requestList<CollectibleOutput>(
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
    CollectibleOutput.fromJson,
  );

  Future<MixinResponse<CollectibleToken>> getToken(String tokenId) =>
      MixinResponse.request<CollectibleToken>(
        dio.get('/collectibles/tokens/$tokenId'),
        CollectibleToken.fromJson,
      );

  Future<MixinResponse<CollectibleCollection>> collections(
    String collectionId,
  ) => MixinResponse.request<CollectibleCollection>(
    dio.get('/collectibles/collections/$collectionId'),
    CollectibleCollection.fromJson,
  );

  Future<MixinResponse<CollectibleRequest>> requests(
    CollectibleRequestAction action,
    String raw,
  ) => MixinResponse.request<CollectibleRequest>(
    dio.post(
      '/collectibles/requests',
      data: {
        'action': action.name,
        'raw': raw,
      },
    ),
    CollectibleRequest.fromJson,
  );
}
