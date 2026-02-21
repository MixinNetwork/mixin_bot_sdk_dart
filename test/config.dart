// Get APP data from https://developers.mixin.one/dashboard
import 'dart:convert';
import 'dart:io';

import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';

final Map<String, dynamic> _keystore = () {
  final content = File('.keystore.json').readAsStringSync();
  return json.decode(content) as Map<String, dynamic>;
}();

final uid = _keystore['app_id'] as String;
final sid = _keystore['session_id'] as String;
final private = Key.fromHexSeed(_keystore['session_private_key'] as String);

final uids = <String>['773e5e77-4107-45c2-b648-8fc722ed77f5'];

const btcId = 'c6d0c728-2624-429b-8e0d-d9d19b6592fa';

const snapshotId = '';

const traceId = '';

const addressId = '';

// var mockRelationshipRequest = RelationshipRequest(
//     userId: '773e5e77-4107-45c2-b648-8fc722ed77f5',
//     action: RelationshipAction.add.toString());

final mockTransferRequest = TransferRequest(assetId: btcId, amount: '100');
final mockPaymentRequest = PaymentRequest(assetId: btcId, amount: '100');

final mockAddressRequest = AddressRequest(assetId: btcId, pin: '');

const multisigId = '';
final mockPinRequest = PinRequest(pin: '', oldPin: '');
final mockOpponentMultisig = OpponentMultisig(
  receivers: <String>['', ''],
  threshold: 10,
);
final mockRawTransactionRequest = RawTransactionRequest(
  assetId: btcId,
  opponentMultisig: mockOpponentMultisig,
  amount: '100',
  pin: '',
);

void testPrint(Object? object) {
  // ignore: avoid_print
  print(object);
}
