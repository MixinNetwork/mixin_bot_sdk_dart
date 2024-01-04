import 'dart:convert';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:convert/convert.dart';
import 'package:decimal/decimal.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;
import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:uuid/uuid.dart';

const botUserId = '';
const botSessionId = '';
const botSessionPrivateKey = '';
const botSpendKey = '';

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
  await transferToUser(
    userId: 'cfb018b0-eaf7-40ec-9e07-28a5158f1269',
    amount: '1',
    // CNB
    asset: '965e5c6e-434c-3fa9-b780-c50f43cd955c',
  );
}

Future<void> transferToUser({
  required String userId,
  required String amount,
  required String asset,
}) async {
  const threshold = 1;
  final recipients = [
    buildSafeTransactionRecipient(
      members: [userId],
      threshold: threshold,
      amount: '1',
    )
  ];

  // get unspent utxos
  final outputs = (await client.utxoApi.getOutputs(
          members: [botUserId], threshold: 1, state: 'unspent', asset: asset))
      .data;

  final (change, utxos) = getUnsentOutputsForRecipients(outputs, recipients);
  if (change > Decimal.zero) {
    recipients.add(
      buildSafeTransactionRecipient(
        members: utxos[0].receivers,
        threshold: utxos[0].receiversThreshold,
        amount: change.toString(),
      ),
    );
  }

  final ghosts = (await client.utxoApi.ghostKey(
          ghostKeyRequests: recipients
              .mapIndexed(
                (index, e) => GhostKeyRequest(
                  receivers: e.members,
                  hint: Uuid().v4(),
                  index: index,
                ),
              )
              .toList()))
      .data;

  final tx = buildSafeTransaction(
      utoxs: utxos, rs: recipients, gs: ghosts, extra: 'test-memo');
  print('tx: $tx');

  final raw = encodeSafeTransaction(tx);
  print('raw: $raw');

  // verify safe transaction
  final requestId = Uuid().v4();
  final verifiedTx = (await client.utxoApi.transactionRequest(
    [
      TransactionRequest(
        requestId: requestId,
        raw: raw,
      )
    ],
  ))
      .data[0];
  print('verifiedTx: $verifiedTx');

  // sign safe transaction with the private key registered in the safe
  final signedRaw = signSafeTransaction(
    tx: tx,
    utxos: utxos,
    views: verifiedTx.views!,
    privateKey: hex.encode(spendKey.bytes),
  );
  print('signedRaw: $signedRaw');

  final sentTx = (await client.utxoApi.transactions(
          [TransactionRequest(raw: signedRaw, requestId: requestId)]))
      .data;
  print('sentTx: $sentTx');
}
