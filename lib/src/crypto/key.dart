import 'dart:typed_data';

import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;
import 'package:edwards25519/edwards25519.dart';

import '../../mixin_bot_sdk_dart.dart';

class PrivateKey {
  PrivateKey(this.bytes)
      : assert(bytes.length == 32, 'bad private key length: ${bytes.length}');

  final Uint8List bytes;

  Uint8List sign(Uint8List message) {
    final digest1 = sha512Hash(Uint8List.sublistView(bytes, 0, 32));
    final messageDigest = sha512Hash(Uint8List.fromList([
      ...Uint8List.sublistView(digest1, 32),
      ...message,
    ]));

    final z = Scalar()..setUniformBytes(messageDigest);
    final r = (Point.newIdentityPoint()..scalarBaseMult(z)).Bytes();

    final pub = _publicKey();

    final hramDigest = sha512Hash(Uint8List.fromList([
      ...r,
      ...pub,
      ...message,
    ]));

    final x = Scalar()..setUniformBytes(hramDigest);
    final y = Scalar()..setCanonicalBytes(bytes);
    final s = Scalar()..multiplyAdd(x, y, z);

    return Uint8List.fromList([
      ...r,
      ...s.Bytes(),
    ]);
  }

  Uint8List _publicKey() {
    final x = Scalar()..setCanonicalBytes(bytes);
    final v = Point.newIdentityPoint()..scalarBaseMult(x);
    return Uint8List.fromList(v.Bytes());
  }

  PublicKey publicKey() => PublicKey(_publicKey());

  String hexString() => bytes.toHexString();
}

class PublicKey {
  PublicKey(this.bytes)
      : assert(bytes.length == 32, 'bad public key length: ${bytes.length}');

  final Uint8List bytes;

  bool verify(Uint8List message, Uint8List signature) {
    final pub = ed.PublicKey(bytes);
    return ed.verify(pub, message, signature);
  }

  String hexString() => bytes.toHexString();
}
