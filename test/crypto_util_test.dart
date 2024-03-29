import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:mixin_bot_sdk_dart/src/util/crypto_util.dart';
import 'package:test/test.dart';

void main() {
  test('test curve25519 conversion', () {
    final publicKey = Uint8List.fromList([
      147,
      193,
      19,
      201,
      96,
      200,
      216,
      248,
      19,
      54,
      49,
      150,
      150,
      167,
      41,
      75,
      87,
      242,
      28,
      199,
      153,
      217,
      6,
      224,
      84,
      169,
      210,
      80,
      186,
      202,
      128,
      201
    ]);
    final privateKey = Uint8List.fromList([
      126,
      51,
      73,
      128,
      30,
      5,
      236,
      244,
      27,
      127,
      26,
      150,
      49,
      250,
      179,
      252,
      107,
      36,
      94,
      118,
      231,
      79,
      230,
      175,
      74,
      217,
      163,
      61,
      162,
      214,
      235,
      156,
      147,
      193,
      19,
      201,
      96,
      200,
      216,
      248,
      19,
      54,
      49,
      150,
      150,
      167,
      41,
      75,
      87,
      242,
      28,
      199,
      153,
      217,
      6,
      224,
      84,
      169,
      210,
      80,
      186,
      202,
      128,
      201
    ]);
    final targetPrivate = Uint8List.fromList([
      232,
      23,
      164,
      168,
      212,
      159,
      250,
      121,
      48,
      244,
      252,
      13,
      183,
      100,
      82,
      162,
      219,
      106,
      10,
      171,
      30,
      240,
      31,
      208,
      91,
      201,
      15,
      179,
      136,
      192,
      210,
      87
    ]);
    final targetPublic = Uint8List.fromList([
      159,
      128,
      169,
      96,
      138,
      29,
      242,
      209,
      248,
      250,
      1,
      148,
      133,
      194,
      107,
      237,
      154,
      18,
      40,
      50,
      51,
      58,
      81,
      213,
      200,
      152,
      8,
      126,
      7,
      140,
      6,
      47
    ]);

    final curve25519PrivateKey = privateKeyToCurve25519(privateKey);
    assert(
        const ListEquality<int>().equals(curve25519PrivateKey, targetPrivate),
        'curve25519PrivateKey: $curve25519PrivateKey, targetPrivate: $targetPrivate');

    final curve25519PublicKey = publicKeyToCurve25519(publicKey);
    assert(const ListEquality<int>().equals(curve25519PublicKey, targetPublic),
        'curve25519PublicKey: $curve25519PublicKey, targetPublic: $targetPublic');
  });
}
