import 'package:convert/convert.dart';

import 'common.dart';

Future<void> main() async {
  const cnb = '965e5c6e-434c-3fa9-b780-c50f43cd955c';
  final balance = await client.utxoApi.assetBalance(
    assetId: cnb,
    threshold: 1,
  );
  print('cnb balance: ${balance}');

  await client.utxoApi.withdrawalToAddress(
    amount: '0.1',
    asset: cnb,
    spendKey: hex.encode(spendKey.bytes),
    destination: '0x5c7D3326f103691F13a427cF29E531b9E5D733E5',
    memo: 'test withdrawal',
  );
}
