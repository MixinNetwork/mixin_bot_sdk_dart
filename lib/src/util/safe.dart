import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:decimal/decimal.dart';
import 'package:edwards25519/edwards25519.dart' show Scalar;
import 'package:thirds/blake3.dart';

import '../../mixin_bot_sdk_dart.dart';
import 'encoder.dart';
import 'multisigs.dart';

class WithdrawalTransactionRecipient implements SafeTransactionRecipient {
  WithdrawalTransactionRecipient({
    required this.destination,
    required this.tag,
    required this.amount,
  }) : assert(destination.isNotEmpty, 'destination is empty');

  final String destination;
  final String? tag;
  final String amount;
}

class UserTransactionRecipient implements SafeTransactionRecipient {
  UserTransactionRecipient({
    required this.members,
    required this.amount,
    required this.threshold,
  }) : assert(members.isNotEmpty, 'members is empty');

  final List<String> members;
  final String amount;
  final int threshold;
}

sealed class SafeTransactionRecipient {}

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
    this.keys = const [],
    this.withdrawal,
    this.script,
    this.mask,
  });

  final OutputType? type;
  final String amount;
  final List<String> keys;
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
    this.reference = const [],
    this.version = kTxVersionHashSignature,
  });

  final int version;

  final String asset;
  final String extra;
  final List<Input> inputs;
  final List<Output> outputs;
  final List<String> reference;
}

@Deprecated('use UserTransactionRecipient instead')
UserTransactionRecipient buildSafeTransactionRecipient({
  required List<String> members,
  required int threshold,
  required String amount,
}) =>
    UserTransactionRecipient(
      members: members,
      threshold: threshold,
      amount: amount,
    );

/// Get unspent utxos for recipients.
///
/// return param1: the amount that we need to get more utxos
///
(Decimal, List<SafeUtxoOutput>) getUnspentOutputsForTransaction(
  List<SafeUtxoOutput> outputs,
  Decimal desiredAmount,
) {
  var candidatesAmount = Decimal.zero;
  final candidates = <SafeUtxoOutput>[];
  for (final o in outputs) {
    if (o.state != OutputState.unspent.name) {
      continue;
    }
    candidates.add(o);
    candidatesAmount += Decimal.parse(o.amount);

    if (candidatesAmount >= desiredAmount) {
      // we get enough utxos
      break;
    }
  }
  return (candidatesAmount, candidates);
}

SafeTransaction buildSafeTransaction({
  required List<SafeUtxoOutput> utxos,
  required List<SafeTransactionRecipient> rs,
  required List<SafeGhostKey?> gs,
  required String extra,
  String? reference,
}) {
  if (utxos.isEmpty) {
    throw Exception('utxo list is empty');
  }
  if (utf8.encode(extra).length > 512) {
    throw Exception('extra data is too long. ${utf8.encode(extra).length}');
  }
  var asset = '';
  final inputs = <Input>[];
  for (final utxo in utxos) {
    if (asset.isEmpty) {
      asset = utxo.asset;
    } else if (asset != utxo.asset) {
      throw Exception('utxo list contains different asset');
    }
    inputs.add(Input(hash: utxo.transactionHash, index: utxo.outputIndex));
  }

  if (rs.length != gs.length) {
    throw Exception('recipient and ghost key count not match');
  }

  final outputs = <Output>[];
  for (var i = 0; i < rs.length; i++) {
    final recipient = rs[i];
    switch (recipient) {
      case WithdrawalTransactionRecipient():
        outputs.add(Output(
            type: OutputType.withdrawalSubmit,
            amount: recipient.amount,
            withdrawal: WithdrawalData(
              address: recipient.destination,
              tag: recipient.tag ?? '',
            )));
      case UserTransactionRecipient():
        assert(gs[i] != null, 'ghost key is null for recipient $i');
        outputs.add(Output(
          type: OutputType.script,
          amount: recipient.amount,
          keys: gs[i]!.keys,
          mask: gs[i]!.mask,
          script: encodeScript(recipient.threshold),
        ));
    }
  }

  return SafeTransaction(
    asset: asset,
    extra: extra,
    inputs: inputs,
    outputs: outputs,
    reference: reference != null ? [reference] : const [],
  );
}

String encodeSafeTransaction(
  SafeTransaction tx, {
  List<Map<int, String>> sigs = const [],
}) {
  final encoder = Encoder()
    ..encodeTransaction(tx)
    ..writeInt(sigs.length);
  for (final sig in sigs) {
    encoder.encodeSignature(sig);
  }
  return encoder.toHex();
}

String signSafeTransaction({
  required SafeTransaction tx,
  required List<SafeUtxoOutput> utxos,
  required List<String> views,
  required Key privateKey,
}) {
  final raw = encodeSafeTransaction(tx);
  final msg = Uint8List.fromList(blake3(hex.decode(raw)));

  assert(privateKey.raw.length >= 32,
      'invalid private key length: ${privateKey.raw.length}');
  final spenty = sha512Hash(privateKey.raw.sublist(0, 32));

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
          'invalid public key for the input: $i ${utxo.keys}, ${key.publicKey().hexString()}');
    }
    final sigs = <int, String>{};
    final sig = key.sign(msg);
    sigs[index] = sig.toHexString();
    signaturesMap.add(sigs);
  }
  return encodeSafeTransaction(tx, sigs: signaturesMap);
}
