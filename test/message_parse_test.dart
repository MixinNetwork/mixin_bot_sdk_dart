import 'package:test/test.dart';
import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';

void main() {
  test('parse attachment message', () {
    final json = {
      'key': 'key',
      'digest': 'digest',
      'attachment_id': 'attachmentId',
      'mime_type': 'mimeType',
      'size': 1,
      'name': 'name',
      'width': '1',
      'height': '1',
      'thumbnail': 'thumbnail',
      'duration': 1,
      'waveform': 'waveform',
      'caption': 'caption',
      'created_at': DateTime.now().toIso8601String(),
    };
    final message = AttachmentMessage.fromJson(json);
    expect(message.key, json['key']);
    expect(message.size, 1);
    expect(message.width, 1);
    expect(message.height, 1);
    expect(message.duration, 1);
  });
}
