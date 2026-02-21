import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:base_x/base_x.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
// ignore: implementation_imports
import 'package:ed25519_edwards/src/edwards25519.dart';
import 'package:pointycastle/export.dart' as pc;
import 'package:uuid/uuid.dart';

Uint8List decodeBase64(String str) {
  try {
    return base64.decode(str);
  } catch (e) {
    var output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
      case 3:
        output += '=';
      default:
        throw Exception('Illegal base64url string!"');
    }

    return base64Url.decode(output);
  }
}

List<int> privateKeyToCurve25519(Uint8List privateKey) {
  final output = AccumulatorSink<Digest>();
  sha512.startChunkedConversion(output)
    ..add(privateKey.sublist(0, 32))
    ..close();
  final digest = output.events.single.bytes.sublist(0, 32);
  digest[0] &= 248;
  digest[31] &= 127;
  digest[31] |= 64;
  return digest;
}

Uint8List publicKeyToCurve25519(Uint8List publicKey) {
  final A = ExtendedGroupElement()..FromBytes(publicKey);

  final x = _edwardsToMontgomeryX(A.Y);
  final curve25519Public = Uint8List(32);
  FeToBytes(curve25519Public, x);
  return curve25519Public;
}

FieldElement _edwardsToMontgomeryX(FieldElement y) {
  final oneMinusY = FieldElement();
  FeOne(oneMinusY);
  FeSub(oneMinusY, oneMinusY, y);
  FeInvert(oneMinusY, oneMinusY);

  final outX = FieldElement();
  FeOne(outX);
  FeAdd(outX, outX, y);

  FeMul(outX, outX, oneMinusY);
  return outX;
}

Uint8List randBytes(int n) {
  final generator = Random.secure();
  final random = Uint8List(n);
  for (var i = 0; i < random.length; i++) {
    random[i] = generator.nextInt(255);
  }
  return random;
}

/// Static factory to retrieve a type 3(name based) UUID based on the given
/// byte array.
/// The same as java.util.UUID.nameUUIDFromBytes.
UuidValue nameUuidFromBytes(List<int> name) {
  final bytes = md5.convert(name).bytes;
  bytes[6] = (bytes[6] & 0x0f) | 0x30;
  bytes[8] = (bytes[8] & 0x3f) | 0x80;
  return UuidValue.fromList(bytes);
}

Uint8List sha3Hash(Uint8List data, {int length = 256}) {
  final digest = pc.SHA3Digest(length);
  return digest.process(data);
}

String hashMembers(List<String> memberIds) {
  final sorted = memberIds.toList()..sort();
  final bytes = const Utf8Encoder().convert(sorted.join());
  return hex.encode(pc.SHA3Digest(256).process(bytes));
}

final base58 = BaseXCodec(
  '123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz',
);

Uint8List sha256Hash(Uint8List data) {
  final digest = pc.SHA256Digest();
  return digest.process(data);
}

Uint8List sha512Hash(Uint8List data) {
  final digest = pc.SHA512Digest();
  return digest.process(data);
}

String uniqueConversationId(String userId, String recipientId) {
  String minId;
  String maxId;
  if (userId.compareTo(recipientId) > 0) {
    minId = recipientId;
    maxId = userId;
  } else {
    minId = userId;
    maxId = recipientId;
  }

  final bytes = utf8.encode(minId + maxId);
  final digest = md5.convert(bytes).bytes;

  digest[6] = (digest[6] & 0x0f) | 0x30;
  digest[8] = (digest[8] & 0x3f) | 0x80;

  // ignore: experimental_member_use
  return UuidValue.fromList(digest).toString();
}

String groupConversationId(
  String ownerId,
  String groupName,
  List<String> participants,
  String randomId,
) {
  // ignore: experimental_member_use
  final normalizedRandomId = UuidValue.fromString(randomId).toString();

  var gid = uniqueConversationId(ownerId, groupName);

  gid = uniqueConversationId(gid, normalizedRandomId);

  final sortedParticipants = participants.toList()..sort();
  for (final participant in sortedParticipants) {
    gid = uniqueConversationId(gid, participant);
  }

  return gid;
}
