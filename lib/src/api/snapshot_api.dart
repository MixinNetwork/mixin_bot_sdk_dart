import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';
import '../vo/snapshot.dart';
import '../vo/ticker.dart';

class SnapshotApi {
  SnapshotApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<List<Snapshot>>> getSnapshots(
          {String? assetId,
          String? offset,
          int limit = 30,
          String? opponent,
          String? destination,
          String? tag}) =>
      MixinResponse.requestList(
        dio.get('/snapshots', queryParameters: {
          'asset': assetId,
          'offset': offset,
          'limit': limit,
          'opponent': opponent,
          'destination': destination,
          'tag': tag,
        }),
        (json) => Snapshot.fromJson(json),
      );

  Future<MixinResponse<Snapshot>> getSnapshotById(String id) =>
      MixinResponse.request<Snapshot>(
        dio.get('/snapshots/$id'),
        (json) => Snapshot.fromJson(json),
      );

  Future<MixinResponse<List<Snapshot>>> getSnapshotsByAssetId(String id,
          {String? offset, int limit = 30}) =>
      MixinResponse.requestList(
        dio.get('/assets/$id/snapshots', queryParameters: {
          'offset': offset,
          'limit': limit,
        }),
        (json) => Snapshot.fromJson(json),
      );

  Future<MixinResponse<Snapshot>> getSnapshotByTraceId(String traceId) =>
      MixinResponse.request(
        dio.get('/snapshots/trace/$traceId'),
        (json) => Snapshot.fromJson(json),
      );

  Future<MixinResponse<Ticker>> getTicker(String assetId, {String? offset}) =>
      MixinResponse.request(
        dio.get('/network/ticker', queryParameters: {
          'asset': assetId,
          'offset': offset,
        }),
        (json) => Ticker.fromJson(json),
      );
}
