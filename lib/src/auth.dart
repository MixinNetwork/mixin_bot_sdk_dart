import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:uuid/uuid.dart';

import '../mixin_bot_sdk_dart.dart';

// Match the Go and Node.js bot SDKs, whose tokens expire 5 minutes after they
// are issued.
const _authTokenLifetime = Duration(minutes: 5);

String signAuthTokenWithRSA(
  String? userId,
  String? sessionId,
  Key? privateKey,
  String? scp,
  String method,
  String uri,
  String body,
) => _signAuthenticationToken(
  userId,
  sessionId,
  privateKey,
  scp,
  method,
  uri,
  body,
  true,
);

String signAuthTokenWithEdDSA(
  String? userId,
  String? sessionId,
  Key? privateKey,
  String? scp,
  String method,
  String uri,
  String body, {
  String? aud,
}) => _signAuthenticationToken(
  userId,
  sessionId,
  privateKey,
  scp,
  method,
  uri,
  body,
  false,
  aud: aud,
);

String _signAuthenticationToken(
  String? userId,
  String? sessionId,
  Key? privateKey,
  String? scp,
  String method,
  String uri,
  String body,
  bool isRSA, {
  String? aud,
}) {
  if ([userId, sessionId].any((element) => element?.isEmpty ?? true)) {
    return '';
  }

  if (privateKey == null) {
    return '';
  }

  final bs = utf8.encode(method + uri + body);

  final hash = sha256.convert(bs);
  final issuedAt = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  final jwt = JWT({
    'uid': userId,
    'sid': sessionId,
    'iat': issuedAt,
    'exp': issuedAt + _authTokenLifetime.inSeconds,
    'jti': const Uuid().v4(),
    'sig': hex.encode(hash.bytes),
    'scp': scp ?? 'FULL',
  });

  if (aud != null) {
    jwt.audience = Audience([aud]);
  }

  return jwt.sign(
    EdDSAPrivateKey(privateKey.raw),
    algorithm: JWTAlgorithm.EdDSA,
  );
}
