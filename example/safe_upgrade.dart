import 'package:convert/convert.dart';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;
import '../lib/mixin_bot_sdk_dart.dart';

import 'common.dart';

/// Samples for upgrade legacy pin to safe
void main() async {
  final sessionKey = ed.generateKey();
  print(hex.encode(sessionKey.privateKey.bytes));

  final user = (await client.userApi.createUsers(
    fullName: 'User_${math.Random().nextInt(10)}',
    sessionSecret: sessionKey.publicKey.bytes.base64RawUrlEncode(),
  ))
      .data;
  print(user.userId);
  print(user.sessionId);

  final userClient = Client(
    sessionPrivateKey: hex.encode(sessionKey.privateKey.bytes),
    sessionId: user.sessionId,
    userId: user.userId,
  );

  // update or setup tip pin, please keep the keyPair and save
  final keyPair = ed.generateKey();
  print(hex.encode(ed.seed(keyPair.privateKey)));
  await userClient.accountApi.updateTipPin(
    legacyPin: '',
    pinTokenBase64: user.pinToken,
    sessionKeyBase64: sessionKey.privateKey.bytes.base64Encode(),
    tipPublicKeyHex: keyPair.publicKey.bytes.toHexString(),
  );

  // verify tip pin
  final timestamp = DateTime.now().microsecondsSinceEpoch * 1000;
  await userClient.accountApi.verifyPin(
    encryptTipPin(
      pinTokenBase64: user.pinToken,
      privateKeyBase64: sessionKey.privateKey.bytes.base64Encode(),
      iterator: timestamp,
      tipPrivateKey: Uint8List.fromList(keyPair.privateKey.bytes),
      signTarget: TipBody.forVerify(timestamp).bytes,
    ),
    timestamp: timestamp,
  );

  final account = await userClient.utxoApi.registerSafe(
    userId: user.userId,
    tipPrivateKey: Uint8List.fromList(keyPair.privateKey.bytes),
    pinTokenBase64: user.pinTokenBase64,
    sessionPrivateKeyBase64: sessionKey.privateKey.bytes.base64Encode(),
  );

  print('account: ${account.userId} ${account.hasSafe}');
}
