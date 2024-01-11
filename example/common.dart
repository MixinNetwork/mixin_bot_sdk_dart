import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;
import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';

import 'constants.dart';

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
