import 'dart:convert';
import 'dart:typed_data';

import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:test/test.dart';

Map<String, dynamic> _payload(String token) {
  final part = token.split('.')[1];
  return jsonDecode(utf8.decode(base64Url.decode(base64Url.normalize(part))))
      as Map<String, dynamic>;
}

void main() {
  final key = Key.fromSeed(Uint8List.fromList(List.filled(32, 7)));

  for (final (name, sign) in [
    ('EdDSA', signAuthTokenWithEdDSA),
    ('RSA', signAuthTokenWithRSA),
  ]) {
    test('$name token expires 5 minutes after it is issued', () {
      final before = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final token = sign('user', 'session', key, null, 'GET', '/me', '');
      final after = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      final payload = _payload(token);
      final iat = payload['iat'] as int;
      expect(iat, inInclusiveRange(before, after));
      expect((payload['exp'] as int) - iat, 300);
    });
  }
}
