import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';

import 'common.dart';
import 'safe_upgrade.dart';

// the key store can from safe_upgrade.dart
final _networkUserKeystore = KeyStore(
  userId: '32cef966-4184-3826-9be1-77470cb6b0ec',
  sessionId: '695775f4-76ac-4eb1-a126-1de49e110f03',
  sessionPrivateKey:
      '986e92602425e1d8f6a5e6a0237a0ac43c327d81579c413fd7b574b65ae75abf',
  spendKey: '51788fd1555838e1313ccf3466b8cf95e56d25cc7e269953135e8be75576f485',
  pinTokenBase64: '_5c1H2IKZxMWDvIN-p4BU58okomPeyWnbmlGZlUmZxU',
);

void main() async {
  final sessionKey = Key.fromHexSeed(_networkUserKeystore.sessionPrivateKey);
  final spendKey = Key.fromHexSeed(_networkUserKeystore.spendKey);

  final userClient = Client(
    sessionPrivateKey: sessionKey,
    sessionId: _networkUserKeystore.sessionId,
    userId: _networkUserKeystore.userId,
  );

  final _ = (await userClient.accountApi.getMe()).data;
  print('spend public key: ${spendKey.publicKey().toHexString()}');

  print(
      'use Mixin Messenger scan the qrcode, and transfer to this network user');
  print('mixin://pay/${_networkUserKeystore.userId}?asset=$cnb');

  final txs = await userClient.utxoApi.transactionToUser(
    receiverIds: ['cfb018b0-eaf7-40ec-9e07-28a5158f1269'],
    amount: '0.01',
    asset: cnb,
    spendKey: spendKey,
  );
  for (final tx in txs) {
    print('view tx in https://viewblock.io/mixin/tx/${tx.transactionHash}');
  }
}
