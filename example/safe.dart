import 'package:convert/convert.dart';

import 'common.dart';


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
