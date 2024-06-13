import 'common.dart';

Future<void> main() async {
  final balance = await client.utxoApi.assetBalance(
    assetId: Token.tronUSDT.assetId,
    threshold: 1,
  );
  print('balance: $balance');

  await client.utxoApi.withdrawalToAddress(
    amount: '0.01',
    asset: Token.tronUSDT.assetId,
    spendKey: spendKey,
    destination: 'TAXE98CMomoA28MtNpfxUutCBq2i4bDbRv',
    memo: 'test withdrawal',
  );
}
