import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:uuid/uuid.dart';
import 'package:x25519/x25519.dart';

import 'util/cbc.dart';
import 'util/crypto_util.dart';

String signAuthTokenWithRSA(
        String? userId,
        String? sessionId,
        String? privateKey,
        String? scp,
        String method,
        String uri,
        String body) =>
    _signAuthenticationToken(
        userId, sessionId, privateKey, scp, method, uri, body, true);

String signAuthTokenWithEdDSA(
        String? userId,
        String? sessionId,
        String? privateKey,
        String? scp,
        String method,
        String uri,
        String body) =>
    _signAuthenticationToken(
        userId, sessionId, privateKey, scp, method, uri, body, false);

String _signAuthenticationToken(
  String? userId,
  String? sessionId,
  String? privateKey,
  String? scp,
  String method,
  String uri,
  String body,
  bool isRSA,
) {
  if ([userId, sessionId, privateKey]
      .any((element) => element?.isEmpty ?? true)) {
    return '';
  }

  final bytes = utf8.encode(method + uri + body);

  final hash = sha256.convert(bytes);
  final jwt = JWT({
    'uid': userId,
    'sid': sessionId,
    'iat': (DateTime.now().millisecondsSinceEpoch / 1000).floor(),
    'exp':
        (DateTime.now().add(const Duration(days: 365)).millisecondsSinceEpoch /
                1000)
            .floor(),
    'jti': const Uuid().v4(),
    'sig': hex.encode(hash.bytes),
    'scp': scp ?? 'FULL',
  });

  final privateBytes = decodeBase64(privateKey!);
  return jwt.sign(EdDSAPrivateKey(privateBytes), algorithm: JWTAlgorithm.EdDSA);
}

String encryptPin(
  String pin,
  String pinTokenBase64,
  String privateKey,
  int iterator,
) {
  final curvePrivKey = privateKeyToCurve25519(decodeBase64(privateKey));
  final public = decodeBase64(pinTokenBase64);
  final keyBytes = X25519(curvePrivKey, public);

  final pinBytes = Uint8List.fromList(utf8.encode(pin));
  final timeBytes = Uint8List(8);
  final iteratorBytes = Uint8List(8);
  // pin+time+iterator
  final nowSec = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  timeBytes.buffer.asByteData().setUint64(0, nowSec, Endian.little);
  iteratorBytes.buffer.asByteData().setUint64(0, iterator, Endian.little);

  final plaintext = Uint8List.fromList(pinBytes + timeBytes + iteratorBytes);
  final iv = Uint8List(16);
  // iv random
  final ciphertext = aesCbcEncrypt(keyBytes, iv, plaintext);
  return base64.encode(iv + ciphertext);
}
