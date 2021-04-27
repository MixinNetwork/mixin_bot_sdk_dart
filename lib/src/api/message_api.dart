import 'package:dio/dio.dart';
import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:mixin_bot_sdk_dart/src/vo/mixin_response.dart';

class MessageApi {
  final Dio dio;

  MessageApi({required this.dio});

  Future<MixinResponse<dynamic>> acknowledgements(List<BlazeAckMessage> ack) =>
      MixinResponse.request<dynamic>(dio.post('/acknowledgements', data: ack));
}
