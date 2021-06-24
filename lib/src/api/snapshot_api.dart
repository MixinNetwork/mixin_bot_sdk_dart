import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';
import '../vo/snapshot.dart';
import '../vo/ticker.dart';

class SnapshotApi {
  SnapshotApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<List<Snapshot>>> getSnapshots() =>
      MixinResponse.request<List<Snapshot>>(dio.get('/snapshots'));

  Future<MixinResponse<Snapshot>> getSnapshotById(String id) =>
      MixinResponse.request<Snapshot>(dio.get('/snapshots/$id'));

  Future<MixinResponse<List<Snapshot>>> getSnapshotsByAssetId(String id) =>
      MixinResponse.request<List<Snapshot>>(dio.get('/assets/$id/snapshots'));

  Future<MixinResponse<Snapshot>> getSnapshotByTraceId(String traceId) =>
      MixinResponse.request<Snapshot>(dio.get('/snapshots/trace/$traceId'));

  Future<MixinResponse<Ticker>> getTicker(String assetId, {String? offset}) =>
      MixinResponse.request<Ticker>(
          dio.get('/ticker?asset=$assetId&offset=$offset'));
}
