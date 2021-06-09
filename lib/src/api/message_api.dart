import 'package:dio/dio.dart';
import '../../mixin_bot_sdk_dart.dart';
import '../vo/mixin_response.dart';

class MessageApi {
  MessageApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<dynamic>> acknowledgements(List<BlazeAckMessage> ack) =>
      MixinResponse.request<dynamic>(dio.post('/acknowledgements', data: ack));
}
