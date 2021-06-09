import 'package:dio/dio.dart';
import '../vo/attachment.dart';

import '../vo/mixin_response.dart';

class AttachmentApi {
  AttachmentApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<Attachment>> getAttachment(String id) =>
      MixinResponse.request<Attachment>(dio.get('/attachments/$id'));

  Future<MixinResponse<Attachment>> postAttachment() =>
      MixinResponse.request<Attachment>(dio.post('/attachments'));
}
