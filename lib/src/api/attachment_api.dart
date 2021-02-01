import 'package:dio/dio.dart';
import 'package:mixin_bot_sdk_dart/src/vo/attachment.dart';

import '../vo/mixin_response.dart';

class AttachmentApi {
  final Dio dio;

  AttachmentApi({this.dio});

  Future<MixinResponse<Attchment>> getAttachment(String id) =>
      MixinResponse.request<Attchment>(dio.get('/attachments/${id}'));

  Future<MixinResponse<Attchment>> postAttachment() =>
      MixinResponse.request<Attchment>(dio.post('/attachments'));
}
