import 'package:dio/dio.dart';
import 'package:mixin_bot_sdk_dart/src/vo/attachment.dart';

import '../vo/mixin_response.dart';

class AttachmentApi {
  final Dio dio;

  AttachmentApi({required  this.dio});

  Future<MixinResponse<Attachment>> getAttachment(String id) =>
      MixinResponse.request<Attachment>(dio.get('/attachments/${id}'));

  Future<MixinResponse<Attachment>> postAttachment() =>
      MixinResponse.request<Attachment>(dio.post('/attachments'));
}
