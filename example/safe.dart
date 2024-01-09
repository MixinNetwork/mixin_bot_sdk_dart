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
);

Future<void> main() async {
  const cnb = '965e5c6e-434c-3fa9-b780-c50f43cd955c';
  final balance = await client.utxoApi.assetBalance(
    assetId: cnb,
    threshold: 1,
  );
  print('cnb balance: ${balance}');

  client.utxoApi.transactionToUser(
    userId: 'cfb018b0-eaf7-40ec-9e07-28a5158f1269',
    amount: '1',
    asset: cnb,
    spendKey: hex.encode(spendKey.bytes),
  );
}
