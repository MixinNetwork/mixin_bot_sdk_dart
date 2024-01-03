// ignore_for_file: cascade_invocations
import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:decimal/decimal.dart';
import 'package:edwards25519/edwards25519.dart' show Scalar, Point;
import 'package:thirds/blake3.dart';

import '../../mixin_bot_sdk_dart.dart';
import '../crypto/key.dart';
import 'encoder.dart';
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

class DepositData {
  DepositData({
    required this.chain,
    required this.asset,
    required this.transaction,
    required this.index,
    required this.amount,
  });

  final String chain;
  final String asset;
  final String transaction;
  final BigInt index;
  final int amount;
}

class MintData {
  MintData({
    required this.group,
    required this.batch,
    required this.amount,
  });

  final String group;
  final BigInt batch;
  final int amount;
}

class Input {
  Input({
    required this.hash,
    required this.index,
    this.genesis,
    this.deposit,
    this.mint,
  });

  final String hash;
  final int index;
  final String? genesis;
  final DepositData? deposit;
  final MintData? mint;
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

const _kMagic = [0x77, 0x77];

String encodeSafeTransaction(
  SafeTransaction tx, {
  List<Map<int, String>> sigs = const [],
}) {
  final encoder = Encoder()
    ..write(_kMagic)
    ..write([0x00, tx.version])
    ..write(hex.decode(tx.asset));

  encoder.writeInt(tx.inputs.length);
  for (final input in tx.inputs) {
    encoder.encodeInput(input);
  }

  encoder.writeInt(tx.outputs.length);
  for (final output in tx.outputs) {
    encoder.encodeOutput(output);
  }

  encoder.writeInt(0);
  final extra = utf8.encode(tx.extra);
  encoder.writeUint32(extra.length);
  encoder.write(extra);

  encoder.writeInt(sigs.length);
  for (final sig in sigs) {
    encoder.encodeSignature(sig);
  }

  return encoder.toHex();
}

String signSafeTransaction({
  required SafeTransaction tx,
  required List<SafeUtxoOutput> utxos,
  required List<String> views,
  required String privateKey,
}) {
  final raw = encodeSafeTransaction(tx);
  final msg = Uint8List.fromList(blake3(hex.decode(raw)));

  final spenty =
      sha512Hash(Uint8List.fromList(hex.decode(privateKey.substring(0, 64))));

  final y = Scalar()..setBytesWithClamping(spenty.sublist(0, 32));
  final signaturesMap = <Map<int, String>>[];
  for (var i = 0; i < tx.inputs.length; i++) {
    final input = tx.inputs[i];
    final utxo = utxos[i];

    if (utxo.transactionHash != input.hash || utxo.outputIndex != input.index) {
      throw Exception('invalid input: $input');
    }

    final view = hex.decode(views[i]);
    final x = Scalar()..setCanonicalBytes(view);
    final t = Scalar()..add(x, y);
    final key = PrivateKey(t.Bytes());
    final index = utxo.keys.indexOf(key.publicKey().hexString());
    if (index == -1) {
      throw Exception(
          'invalid public key for the input: $input, ${key.publicKey().hexString()}');
    }
    final sigs = <int, String>{};
    final sig = key.sign(msg);
    sigs[index] = sig.toHexString();
    signaturesMap.add(sigs);
  }
  return encodeSafeTransaction(tx, sigs: signaturesMap);
}
