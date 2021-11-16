import 'package:dio/dio.dart';
import '../../mixin_bot_sdk_dart.dart';

class MessageApi {
  MessageApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<dynamic>> acknowledgements(List<BlazeAckMessage> ack) =>
      MixinResponse.request<dynamic>(
          dio.post('/acknowledgements', data: ack), (json) => json);

  Future<MixinResponse<dynamic>> messageStatusOffset(int offset) =>
      MixinResponse.request<dynamic>(
          dio.get('/messages/status/$offset'), (json) => json);
}
