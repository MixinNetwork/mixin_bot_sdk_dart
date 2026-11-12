import '../../mixin_bot_sdk_dart.dart';

Future<String> signOnSignerIsolate({
  required SafeTransaction tx,
  required List<SafeUtxoOutput> utxos,
  required List<String> views,
  required Key privateKey,
}) async => signSafeTransaction(
  tx: tx,
  utxos: utxos,
  views: views,
  privateKey: privateKey,
);
