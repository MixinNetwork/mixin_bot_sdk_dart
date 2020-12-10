import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:mixin_bot_sdk_dart/src/crypto_util.dart';
import 'package:test/test.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart';
import 'package:ed25519_edwards/src/edwards25519.dart';

void main() {
  test('test curve25519 conversion', () {
    var keyPair = generateKey();
    var privateKey = keyPair.privateKey;
    var publicKey = keyPair.publicKey;

    var curve25519Private = privateKeyToCurve25519(privateKey.bytes);

    // Calculate Ed25519 public key from Curve25519 private key
    var A = ExtendedGroupElement();
    var edPublic = Uint8List(32);
    GeScalarMultBase(A, curve25519Private);
    A.ToBytes(edPublic);

    assert(ListEquality().equals(edPublic, publicKey.bytes));

    var curve25519PublicKey2 = publicKeyToCurve25519(publicKey.bytes);

    // Calculate Ed25519 public key from Curve25519 public key
    curve25519PublicKey2[31] &= 0x7F;
    var edY = FieldElement();
    var one = FieldElement();
    var montX = FieldElement();
    var montXMinusOne = FieldElement();
    var montXPlusOne = FieldElement();
    FeFromBytes(montX, curve25519PublicKey2);
    FeOne(one);
    FeSub(montXMinusOne, montX, one);
    FeAdd(montXPlusOne, montX, one);
    FeInvert(montXPlusOne, montXPlusOne);
    FeMul(edY, montXMinusOne, montXPlusOne);
    var A_ed = Uint8List(32);
    FeToBytes(A_ed, edY);

    assert(ListEquality().equals(A_ed, publicKey.bytes));
  });
}