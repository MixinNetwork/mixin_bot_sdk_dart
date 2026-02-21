import 'dart:typed_data';

import 'package:pointycastle/export.dart';

PaddedBlockCipherImpl _createAESCipher({
  required Uint8List aesKey,
  required Uint8List iv,
  required bool encrypt,
}) {
  final cbcCipher = CBCBlockCipher(AESEngine());
  return PaddedBlockCipherImpl(PKCS7Padding(), cbcCipher)..init(
    encrypt,
    PaddedBlockCipherParameters(
      ParametersWithIV(KeyParameter(aesKey), iv),
      null,
    ),
  );
}

Uint8List aesCbcEncrypt(Uint8List key, Uint8List iv, Uint8List plaintext) {
  final cipher = _createAESCipher(aesKey: key, iv: iv, encrypt: true);
  return cipher.process(plaintext);
}

Uint8List aesCbcDecrypt(Uint8List key, Uint8List iv, Uint8List cipherText) {
  final cipher = _createAESCipher(aesKey: key, iv: iv, encrypt: false);
  return cipher.process(cipherText);
}
