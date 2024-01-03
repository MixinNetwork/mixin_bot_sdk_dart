import 'dart:convert';

import 'package:decimal/decimal.dart';

import '../../mixin_bot_sdk_dart.dart';
import 'multisigs.dart';

class SafeTransactionRecipient {
  SafeTransactionRecipient({
    required this.members,
    required this.threshold,
    required this.mixAddress,
    required this.amount,
    this.destination,
    this.tag,
  });

  final List<String> members;
  final int threshold;
  final String mixAddress;
  final String amount;
  final String? destination;
  final String? tag;
}

class Input {
  Input({required this.hash, required this.index});

  final String hash;
  final int index;
}

enum OutputType {
  script(0x00),
  withdrawalSubmit(0xa1);

  const OutputType(this.value);

  final int value;
}

class WithdrawalData {
  WithdrawalData({
    required this.address,
    required this.tag,
    this.chain,
    this.asset,
  });

  final String address;
  final String tag;
  final String? chain;
  final String? asset;
}

class Output {
  Output({
    required this.type,
    required this.amount,
    this.keys,
    this.withdrawal,
    this.script,
    this.mask,
  });

  final OutputType? type;
  final String amount;
  final List<String>? keys;
  final WithdrawalData? withdrawal;
  final String? script;
  final String? mask;
}

const kTxVersionHashSignature = 0x05;

class SafeTransaction {
  SafeTransaction({
    required this.asset,
    required this.extra,
    required this.inputs,
    required this.outputs,
    this.version = kTxVersionHashSignature,
  });

  final int version;

  final String asset;
  final String extra;
  final List<Input> inputs;
  final List<Output> outputs;
}

SafeTransactionRecipient buildSafeTransactionRecipient({
  required List<String> members,
  required int threshold,
  required String amount,
}) =>
    SafeTransactionRecipient(
      members: members,
      threshold: threshold,
      amount: amount,
      mixAddress:
          MixAddress(members: members, threshold: threshold).toAddress(),
    );

(Decimal, List<SafeUtxoOutput>) getUnsentOutputsForRecipients(
  List<SafeUtxoOutput> outputs,
  List<SafeTransactionRecipient> recipients,
) {
  final totalOutput = recipients.fold(
      Decimal.zero, (value, element) => value + Decimal.parse(element.amount));
  var totalInput = Decimal.zero;
  for (var i = 0; i < outputs.length; i++) {
    final o = outputs[i];
    if (o.state != OutputState.unspent.name) {
      continue;
    }
    totalInput += Decimal.parse(o.amount);
    if (totalInput < totalOutput) {
      continue;
    }
    return (totalInput - totalOutput, outputs.sublist(0, i + 1));
  }
  throw Exception('not enough utxo');
}

SafeTransaction buildSafeTransaction({
  required List<SafeUtxoOutput> utoxs,
  required List<SafeTransactionRecipient> rs,
  required List<SafeGhostKey> gs,
  required String extra,
}) {
  if (utoxs.isEmpty) {
    throw Exception('utxo list is empty');
  }
  if (utf8.encode(extra).length > 512) {
    throw Exception('extra data is too long. ${utf8.encode(extra).length}');
  }
  var asset = '';
  final inputs = <Input>[];
  for (final utxo in utoxs) {
    if (asset.isEmpty) {
      asset = utxo.asset;
    } else if (asset != utxo.asset) {
      throw Exception('utxo list contains different asset');
    }
    inputs.add(Input(hash: utxo.transactionHash, index: utxo.outputIndex));
  }

  final outputs = <Output>[];
  for (var i = 0; i < rs.length; i++) {
    final recipient = rs[i];
    if (recipient.destination != null || recipient.destination!.isNotEmpty) {
      outputs.add(Output(
          type: OutputType.withdrawalSubmit,
          amount: recipient.amount,
          withdrawal: WithdrawalData(
            address: recipient.destination!,
            tag: recipient.tag ?? '',
          )));
    } else {
      outputs.add(Output(
        type: OutputType.script,
        amount: recipient.amount,
        keys: gs[i].keys,
        mask: gs[i].mask,
        script: encodeScript(recipient.threshold),
      ));
    }
  }

  return SafeTransaction(
    asset: asset,
    extra: extra,
    inputs: inputs,
    outputs: outputs,
  );
}
