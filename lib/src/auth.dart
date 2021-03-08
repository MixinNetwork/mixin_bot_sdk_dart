import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:jose/jose.dart';
import 'package:crypto_keys/crypto_keys.dart';
import 'package:uuid/uuid.dart';

import 'crypto_util.dart';

Future<String> signAuthTokenWithRSA(String userId, String sessionId,
    String privateKey, String? scp, String method, String uri, String body) async {
  return await _signAuthenticationToken(
      userId, sessionId, privateKey, scp, method, uri, body, true);
}

Future<String> signAuthTokenWithEdDSA(String userId, String sessionId,
    String privateKey, String? scp, String method, String uri, String body) async {
  return await _signAuthenticationToken(
      userId, sessionId, privateKey, scp, method, uri, body, false);
}

Future<String> _signAuthenticationToken(String userId, String sessionId,
    String privateKey, scp, method, uri, body, bool isRSA) async {
  final bytes = utf8.encode(method + uri + body);

  final hash = await sha512.convert(bytes);
  final claims = JsonWebTokenClaims.fromJson({
    'uid': userId,
    'sid': sessionId,
    'iat': (DateTime.now().millisecondsSinceEpoch / 1000).floor(),
    'exp':
        (DateTime.now().add(Duration(days: 365)).millisecondsSinceEpoch / 1000)
            .floor(),
    'jti': Uuid().v4(),
    'sig': hex.encode(hash.bytes),
    'scp': scp ?? 'FULL',
  });

  JsonWebKey key;
  String alg;
  if (isRSA) {
    key = JsonWebKey.fromPem(privateKey);
    alg = 'RS512';
  } else {
    var privateBytes = decodeBase64(privateKey);
    key = JsonWebKey.fromCryptoKeys(
        privateKey: EdDSAPrivateKey(bytes: privateBytes));
    alg = 'EdDSA';
  }
  final builder = JsonWebSignatureBuilder();
  builder.jsonContent = claims.toJson();
  builder.addRecipient(key, algorithm: alg);

  return '${builder.build().toCompactSerialization()}';
}
