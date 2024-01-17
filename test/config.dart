// Get APP data from https://developers.mixin.one/dashboard
import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';

const uid = '23cec735-ffb8-435d-8c2c-e352c98a8b59';
const sid = '63f600c8-7247-4a02-8a71-1546c3a2abdb';
const private =
    'da34117b06b3d186d9f3455717b67861b5340f283c613f75ccb39092485b722bc9db931e3cea42c34f5d33afa306ed2f0b24446779a4e3347cdead21e0216480';

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
final mockOpponentMultisig =
    OpponentMultisig(receivers: <String>['', ''], threshold: 10);
final mockRawTransactionRequest = RawTransactionRequest(
    assetId: btcId,
    opponentMultisig: mockOpponentMultisig,
    amount: '100',
    pin: '');

void testPrint(Object? object) {
  // ignore: avoid_print
  print(object);
}
