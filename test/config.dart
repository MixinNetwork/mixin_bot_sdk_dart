// Get APP data from https://developers.mixin.one/dashboard
import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';

const uid = '23cec735-ffb8-435d-8c2c-e352c98a8b59';
const sid = '63f600c8-7247-4a02-8a71-1546c3a2abdb';
const private =
    '2jQRewaz0YbZ80VXF7Z4YbU0Dyg8YT91zLOQkkhbcivJ25MePOpCw09dM6-jBu0vCyREZ3mk4zR83q0h4CFkgA';

final uids = <String>['773e5e77-4107-45c2-b648-8fc722ed77f5'];

final btcId = 'c6d0c728-2624-429b-8e0d-d9d19b6592fa';

final snapshotId = '';

final traceId = '';

final addressId = '';

// var mockRelationshipRequest = RelationshipRequest(
//     userId: '773e5e77-4107-45c2-b648-8fc722ed77f5',
//     action: RelationshipAction.add.toString());

final mockTransferRequest = TransferRequest(assetId: btcId, amount: '100');
final mockWithdrawalRequest =
    WithdrawalRequest(addressId: '', amount: '100', pin: '', traceId: '');

final mockAddressRequest = AddressRequest(assetId: btcId, pin: '');

final multisigId = '';
final mockPinRequest = PinRequest(pin: '', oldPin: '');
final mockOpponentMultisig =
    OpponentMultisig(receivers: <String>['', ''], threshold: 10);
final mockRawTransactionRequest = RawTransactionRequest(
    assetId: btcId,
    opponentMultisig: mockOpponentMultisig,
    amount: '100',
    pin: '');
