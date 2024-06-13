import 'common.dart';

Future<void> main() async {
  final balance = await client.utxoApi.assetBalance(
    assetId: Token.cnb.assetId,
    threshold: 1,
  );
  print('cnb balance: $balance');

  // transaction to one user
  await client.utxoApi.transactionToUser(
    receiverIds: ['cfb018b0-eaf7-40ec-9e07-28a5158f1269'],
    amount: '0.0001',
    asset: Token.cnb.assetId,
    spendKey: spendKey,
    memo: 'test transfer',
  );
}
