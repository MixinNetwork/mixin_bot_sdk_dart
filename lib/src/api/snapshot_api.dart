import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';

class SnapshotApi {
  SnapshotApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<List<Snapshot>>> getSnapshots(
          {String? assetId,
          int? offset,
          int limit = 30,
          String? opponent,
          String? destination,
          String? tag}) =>
      MixinResponse.requestList(
        dio.get('/snapshots', queryParameters: <String, dynamic>{
          if (assetId != null && assetId.isNotEmpty) 'asset': assetId,
          if (offset != null) 'offset': offset.toString(),
          'limit': limit,
          if (opponent != null && opponent.isNotEmpty) 'opponent': opponent,
          if (destination != null && destination.isNotEmpty)
            'destination': destination,
          if (tag != null && tag.isNotEmpty) 'tag': tag,
        }),
        Snapshot.fromJson,
      );

  Future<MixinResponse<Snapshot>> getSnapshotById(String id) =>
      MixinResponse.request<Snapshot>(
        dio.get('/snapshots/${Uri.encodeComponent(id)}'),
        Snapshot.fromJson,
      );

  Future<MixinResponse<List<Snapshot>>> getSnapshotsByAssetId(
    String id, {
    int? offset,
    int limit = 30,
  }) =>
      MixinResponse.requestList(
        dio.get('/assets/${Uri.encodeComponent(id)}/snapshots',
            queryParameters: <String, dynamic>{
              if (offset != null) 'offset': offset.toString(),
              'limit': limit,
            }),
        Snapshot.fromJson,
      );

  Future<MixinResponse<Snapshot>> getSnapshotByTraceId(String traceId) =>
      MixinResponse.request(
        dio.get('/snapshots/trace/${Uri.encodeComponent(traceId)}'),
        Snapshot.fromJson,
      );

  Future<MixinResponse<Ticker>> getTicker(String assetId, {int? offset}) =>
      MixinResponse.request(
        dio.get('/network/ticker', queryParameters: <String, dynamic>{
          'asset': assetId,
          if (offset != null) 'offset': offset.toString(),
        }),
        Ticker.fromJson,
      );
}
