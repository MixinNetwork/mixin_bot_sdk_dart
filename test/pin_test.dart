import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:test/test.dart';

void main() {
  test('test encryptPin', () {
    const pin = '123456';
    const pinTokenBase64 = 'PgZHafXZXPBtJA4dKFf0kO4IHPOZouJJFSkr3zkn8Ws';
    const privateKey =
        '5B_ceKifPn-egAHE7v2TRjiTqbvZnq43Hp03ag5nhUPXdqBb54EYQ_XA_3bCeyZZQqnWKEIXRamCQVtJiiefKA';
    const iterator = 1;
    final iv = hex.decode('ce487d133c307d6b9bed18a4df43c2c8');
    const time = 1658399540;
    final c = encryptPinWithIv(pin, pinTokenBase64, privateKey, iterator, time,
        Uint8List.fromList(iv));
    expect(
        c, 'zkh9EzwwfWub7Rik30PCyDYYPfbrOIs-dxG-5BmXaocQp3kMOmcG76QiqoTyYwim');
  });
}
