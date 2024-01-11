import 'package:convert/convert.dart';

import 'common.dart';

Future<void> main() async {
  final balance = await client.utxoApi.assetBalance(
    assetId: Token.cnb.assetId,
    threshold: 1,
  );
  print('cnb balance: ${balance}');

  await client.utxoApi.transactionToUser(
    userId: 'cfb018b0-eaf7-40ec-9e07-28a5158f1269',
    amount: '0.0001',
    asset: Token.cnb.assetId,
    spendKey: hex.encode(spendKey.bytes),
    memo: 'test transfer',
  );
}
