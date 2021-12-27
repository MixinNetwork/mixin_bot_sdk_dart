import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';

class MessageApi {
  MessageApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<void>> acknowledgements(List<BlazeAckMessage> ack) =>
      MixinResponse.requestVoid(dio.post('/acknowledgements', data: ack));

  Future<MixinResponse<void>> messageStatusOffset(int offset) =>
      MixinResponse.requestVoid(dio.get('/messages/status/$offset'));
}
