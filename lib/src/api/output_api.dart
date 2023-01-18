import 'package:diox/diox.dart';

import '../../mixin_bot_sdk_dart.dart';

class OutputApi {
  OutputApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<List<GhostKey>>> loadGhostKeys(
          List<OutputRequest> request) =>
      MixinResponse.requestList<GhostKey>(
        dio.post(
          '/outputs',
          data: request.map((e) => e.toJson()).toList(),
        ),
        (json) => GhostKey.fromJson(json),
      );
}
