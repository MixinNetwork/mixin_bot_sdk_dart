import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:cryptography/cryptography.dart';
import 'package:jose/jose.dart';
import 'package:uuid/uuid.dart';

import './extension/string_extension.dart';

String signAuthenticationToken(
    String userId, String sessionId, String privateKey, method, uri, body) {
  if (userId.isNullOrEmpty ||
      sessionId.isNullOrEmpty ||
      privateKey.isNullOrEmpty) {
    return '';
  }
  final bytes = utf8.encode(method + uri + body);

  final hash = sha256.hashSync(bytes);
  final claims = JsonWebTokenClaims.fromJson({
    'uid': userId,
    'sid': sessionId,
    'iat': (DateTime.now().millisecondsSinceEpoch / 1000).floor(),
    'exp':
        (DateTime.now().add(Duration(days: 365)).millisecondsSinceEpoch / 1000)
            .floor(),
    'jti': Uuid().v4(),
    'sig': hex.encode(hash.bytes),
    'scp': 'FULL',
  });

  final key = JsonWebKey.fromPem(privateKey);
  final builder = JsonWebSignatureBuilder();
  builder.jsonContent = claims.toJson();
  builder.addRecipient(key, algorithm: 'RS512');

  return '${builder.build().toCompactSerialization()}';
}
