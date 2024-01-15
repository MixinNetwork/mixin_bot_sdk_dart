import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;
import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';

import 'constants.dart';

late final privateKey = base64Encode(ed
    .newKeyFromSeed(Uint8List.fromList(hex.decode(botSessionPrivateKey)))
    .bytes);
late final spendKey =
    ed.newKeyFromSeed(Uint8List.fromList(hex.decode(botSpendKey)));

late Client client = Client(
  privateKey: privateKey,
  sessionId: botSessionId,
  userId: botUserId,
)..dio.options.extra['retry'] = true;

const tronUSDT = 'b91e18ff-a9ae-3dc7-8679-e935d9a4b34b';
const cnb = '965e5c6e-434c-3fa9-b780-c50f43cd955c';

enum Token {
  cnb('965e5c6e-434c-3fa9-b780-c50f43cd955c'),
  tronUSDT('b91e18ff-a9ae-3dc7-8679-e935d9a4b34b'),
  trx('25dabac5-056a-48ff-b9f9-f67395dc407c');

  final String assetId;

  const Token(this.assetId);
}
