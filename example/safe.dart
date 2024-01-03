import 'package:collection/collection.dart';
import 'package:decimal/decimal.dart';
import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:uuid/uuid.dart';

late Client client;

Future<void> main() async {
  // destination
  const members = ['7766b24c-1a03-4c3a-83a3-b4358266875d'];
  const threshold = 1;
  final recipients = [
    buildSafeTransactionRecipient(
      members: members,
      threshold: threshold,
      amount: '1',
    )
  ];

  // get unspent utxos
  final outputs = (await client.utxoApi
          .getOutputs(members: [], threshold: 1, state: 'unspent'))
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
}
