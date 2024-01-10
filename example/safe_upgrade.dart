import 'dart:convert';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;
import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';

import 'common.dart';

/// Samples for upgrade legacy pin to safe
void main() async {
  final sessionKey = ed.generateKey();

  final sessionSecret = base64Encode(sessionKey.publicKey.bytes);
  final user = (await client.userApi.createUsers(
    fullName: 'User_${math.Random().nextInt(10)}',
    sessionSecret: sessionSecret,
  ))
      .data;

  final userClient = Client(
    privateKey: base64Encode(sessionKey.privateKey.bytes),
    sessionId: user.sessionId,
    userId: user.userId,
  );

  // create user pin
  await userClient.accountApi.createPin(
    encryptPin(
      '000000',
      user.pinToken,
      base64Encode(sessionKey.privateKey.bytes),
      DateTime.now().millisecondsSinceEpoch * 1000000,
    ),
  );

  // verify user pin
  await userClient.accountApi.verifyPin(encryptPin(
    '000000',
    user.pinToken,
    base64Encode(sessionKey.privateKey.bytes),
    DateTime.now().millisecondsSinceEpoch * 1000000,
  ));

  // update tip pin
  final keyPair = ed.generateKey();
  await userClient.accountApi.updateTipPin(
    legacyPin: '000000',
    pinTokenBase64: user.pinToken,
    sessionKeyBase64: sessionKey.privateKey.bytes.base64Encode(),
    tipPublicKeyHex: keyPair.publicKey.bytes.toHexString(),
  );

  // verify tip pin
  final timestamp = DateTime.now().microsecondsSinceEpoch * 1000;
  await userClient.accountApi.verifyPin(
    encryptTipPin(
      pinTokenBase64: user.pinToken,
      privateKeyBase64: base64Encode(sessionKey.privateKey.bytes),
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
