import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';

import 'constants.dart';

late final privateKey = () {
  if (botSessionPrivateKey.isEmpty) {
    throw Exception('botSessionPrivateKey is not configured');
  }
  return Key.fromHexSeed(botSessionPrivateKey);
}();
late final spendKey = () {
  if (botSpendKey.isEmpty) {
    throw Exception('botSpendPrivateKey is not configured');
  }
  return Key.fromHexSeed(botSpendKey);
}();

late Client client = Client(
  sessionPrivateKey: privateKey,
  sessionId: botSessionId,
  userId: botUserId,
);

const tronUSDT = 'b91e18ff-a9ae-3dc7-8679-e935d9a4b34b';
const cnb = '965e5c6e-434c-3fa9-b780-c50f43cd955c';

enum Token {
  cnb('965e5c6e-434c-3fa9-b780-c50f43cd955c'),
  tronUSDT('b91e18ff-a9ae-3dc7-8679-e935d9a4b34b'),
  trx('25dabac5-056a-48ff-b9f9-f67395dc407c');

  final String assetId;

  const Token(this.assetId);
}
