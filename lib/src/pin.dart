import 'dart:convert';
import 'dart:typed_data';

import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;
import 'package:fixnum/fixnum.dart';
import 'package:x25519/x25519.dart';

import '../mixin_bot_sdk_dart.dart';
import 'util/cbc.dart';

String encryptPin(
  String pin,
  String pinTokenBase64,
  String privateKey,
  int iterator,
) {
  final iv = randBytes(16);
  final nowSec = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  return encryptPinWithIv(
      pin, pinTokenBase64, privateKey, iterator, nowSec, iv);
}

String encryptPinWithIv(
  String pin,
  String pinTokenBase64,
  String privateKey,
  int iterator,
  int nowSec,
  Uint8List iv,
) {
  final curvePrivKey = privateKeyToCurve25519(decodeBase64(privateKey));
  final public = decodeBase64(pinTokenBase64);
  final keyBytes = X25519(curvePrivKey, public);

  final pinBytes = Uint8List.fromList(utf8.encode(pin));
  final timeBytes = Int64(nowSec).toBytes();
  final iteratorBytes = Int64(iterator).toBytes();

  // pin+time+iterator
  final plaintext = Uint8List.fromList(pinBytes + timeBytes + iteratorBytes);
  final ciphertext = aesCbcEncrypt(keyBytes, iv, plaintext);
  return (iv + ciphertext).base64RawUrlEncode();
}

String encryptBytesPin({
  required String pinTokenBase64,
  required String privateKeyBase64,
  required Uint8List target,
  int? iterator,
  Uint8List? iv,
  DateTime? now,
}) {
  final curvePrivKey = privateKeyToCurve25519(decodeBase64(privateKeyBase64));
  final public = decodeBase64(pinTokenBase64);
  final keyBytes = X25519(curvePrivKey, public);

  now ??= DateTime.now();
  iterator ??= now.millisecondsSinceEpoch * 1000000;
  final nowSec = now.millisecondsSinceEpoch ~/ 1000;
  final plaintext =
      target + Int64(nowSec).toBytes() + Int64(iterator).toBytes();
  iv ??= randBytes(16);
  assert(iv.length == 16, 'iv length must be 16');

  final cipherText = aesCbcEncrypt(keyBytes, iv, Uint8List.fromList(plaintext));
  return (iv + cipherText).base64RawUrlEncode();
}

String encryptTipPin({
  required String pinTokenBase64,
  required String privateKeyBase64,
  required Uint8List signTarget,
  required Uint8List tipPrivateKey,
  int? iterator,
  Uint8List? iv,
}) {
  final tipPri = ed.PrivateKey(tipPrivateKey);
  final sig = ed.sign(tipPri, signTarget);
  return encryptBytesPin(
    pinTokenBase64: pinTokenBase64,
    privateKeyBase64: privateKeyBase64,
    target: sig,
    iterator: iterator,
    iv: iv,
  );
}
