import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';

class CollectibleApi {
  CollectibleApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<CollectibleOutput>> getOutputs(
    String state,
    String offset,
    int limit,
    String members,
    int threshold,
  ) =>
      MixinResponse.request<CollectibleOutput>(
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

  Future<MixinResponse<CollectibleToken>> getToken(
    String tokenId,
  ) =>
      MixinResponse.request<CollectibleToken>(
        dio.get('/collectibles/tokens/$tokenId'),
        (json) => CollectibleToken.fromJson(json),
      );
}
