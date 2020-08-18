import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:sprintf/sprintf.dart';
import 'package:uuid/uuid.dart';
import 'package:cryptography/cryptography.dart';
import 'package:jose/jose.dart';

Future<String> signAuthenticationToken(String userId, sessionId, privateKey, method, uri, body) async {
  var bytes = utf8.encode(method + uri + body); 
  final hash = await sha256.hash(bytes);

  var claims = JsonWebTokenClaims.fromJson({
    'uid': userId,
    'sid': sessionId,
    "iat": (DateTime.now().millisecondsSinceEpoch / 1000).floor(),
		"exp": (DateTime.now().add(Duration(days: 365)).millisecondsSinceEpoch / 1000).floor(),
		"jti": Uuid().v4(),
    'sig': hex.encode(hash.bytes),
    'scp': 'FULL',
  });

  var builder = JsonWebSignatureBuilder();
  builder.jsonContent = claims.toJson();
  var key = JsonWebKey.fromPem(privateKey);
  builder.addRecipient(key, algorithm: 'RS512');
  var jws = builder.build();

  return '${jws.toCompactSerialization()}';
}
