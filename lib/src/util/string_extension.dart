import 'dart:convert' as c1;
import 'dart:typed_data';

import 'package:convert/convert.dart' as c2;

import 'crypto_util.dart' as util;

extension StringHash on String {
  int uuidHashcode() {
    final components = split('-');
    assert(components.length == 5, 'bad length');
    final mostSigBits = (int.parse(components[0], radix: 16) << 32) |
        (int.parse(components[1], radix: 16) << 16) |
        (int.parse(components[2], radix: 16));
    final leastSigBits = (int.parse(components[3], radix: 16) << 48) |
        (int.parse(components[4], radix: 16));
    final hilo = mostSigBits ^ leastSigBits;
    return (hilo >> 32) ^ hilo.toSigned(32);
  }

  Uint8List toBytes() => const c1.Utf8Encoder().convert(this);

  Uint8List hexToBytes() => Uint8List.fromList(c2.hex.decode(this));

  Uint8List sha3Hash([int length = 256]) =>
      util.sha3Hash(toBytes(), length: length);

  Uint8List sha256() => util.sha256Hash(toBytes());
}

extension HexEncoder on List<int> {
  String toHexString() => c2.hex.encode(this);

  String base64UrlEncode() => c1.base64UrlEncode(this);

  String base64Encode() => c1.base64Encode(this);

  String base64RawUrlEncode() {
    final encoded = c1.base64UrlEncode(this);
    // remove trailing ==
    final index = encoded.indexOf('=');
    if (index == -1) return encoded;
    return encoded.substring(0, index);
  }
}
