import 'dart:convert';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;

import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'common.dart';

class KeyStore {
  KeyStore({
    required this.userId,
    required this.sessionId,
    required this.sessionPrivateKey,
    required this.spendKey,
    required this.pinTokenBase64,
  });

  final String userId;
  final String sessionId;
  final String sessionPrivateKey;
  final String spendKey;
  final String pinTokenBase64;

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'session_id': sessionId,
        'session_private_key': sessionPrivateKey,
        'spend_key': spendKey,
        'pin_token_base64': pinTokenBase64,
      };
}

/// Samples for upgrade legacy pin to safe
void main() async {
  final sessionKey = ed.generateKey();
  print(hex.encode(ed.seed(sessionKey.privateKey)));

  final user = (await client.userApi.createUsers(
    fullName: 'User_${math.Random().nextInt(10)}',
    sessionSecret: sessionKey.publicKey.bytes.base64RawUrlEncode(),
  ))
      .data;
  print(user.userId);
  print(user.sessionId);

  final userClient = Client(
    sessionPrivateKey:
        Key.fromRaw(Uint8List.fromList(sessionKey.privateKey.bytes)),
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

  final keystore = KeyStore(
    userId: user.userId,
    sessionId: user.sessionId,
    sessionPrivateKey: hex.encode(ed.seed(sessionKey.privateKey)),
    spendKey: hex.encode(ed.seed(keyPair.privateKey)),
    pinTokenBase64: user.pinTokenBase64,
  );
  print('keystore(please save it): \n${jsonEncode(keystore.toJson())}');
}
