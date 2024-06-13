import 'dart:typed_data';

import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;

import '../../mixin_bot_sdk_dart.dart';

/// An utility class for SpendKey and SessionPrivateKey
class Key {
  const Key.fromRaw(this._raw);

  factory Key.fromBase64(String base64) => Key.fromRaw(decodeBase64(base64));

  factory Key.froHex(String hex) => Key.fromRaw(hex.hexToBytes());

  factory Key.fromSeed(Uint8List seed) {
    final key = ed.newKeyFromSeed(seed);
    return Key.fromRaw(Uint8List.fromList(key.bytes));
  }

  /// Generate a key from a hex seed.
  /// Usually used for key which from dashboard (https://developers.mixin.one/dashboard).
  factory Key.fromHexSeed(String seedInHex) =>
      Key.fromSeed(seedInHex.hexToBytes());

  Uint8List publicKey() =>
      Uint8List.fromList(ed.public(ed.PrivateKey(raw)).bytes);

  final Uint8List _raw;

  Uint8List get raw => _raw;

  String get hex => _raw.toHexString();
}
