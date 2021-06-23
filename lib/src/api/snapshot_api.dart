import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';
import '../vo/snapshot.dart';

class SnapshotApi {
  SnapshotApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<List<Snapshot>>> getSnapshots() =>
      MixinResponse.request<List<Snapshot>>(dio.get('/snapshots'));

  Future<MixinResponse<Snapshot>> getSnapshotById(String id) =>
      MixinResponse.request<Snapshot>(dio.get('/snapshots/$id'));
}
