import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:convert/convert.dart';
import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';

void main() {
  test('test encryptPin', () {
    final pin = '123456';
    final pinTokenBase64 = 'PgZHafXZXPBtJA4dKFf0kO4IHPOZouJJFSkr3zkn8Ws';
    final privateKey =
        '5B_ceKifPn-egAHE7v2TRjiTqbvZnq43Hp03ag5nhUPXdqBb54EYQ_XA_3bCeyZZQqnWKEIXRamCQVtJiiefKA';
    final iterator = 1;
    final iv = hex.decode('ce487d133c307d6b9bed18a4df43c2c8');
    final time = 1658399540;
    final c = encryptPinWithIv(pin, pinTokenBase64, privateKey, iterator, time,
        Uint8List.fromList(iv));
    expect(
        c, 'zkh9EzwwfWub7Rik30PCyDYYPfbrOIs-dxG-5BmXaocQp3kMOmcG76QiqoTyYwim');
  });
}
