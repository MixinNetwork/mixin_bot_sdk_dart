import 'dart:typed_data';

import '../../mixin_bot_sdk_dart.dart';

class TipBody {
  factory TipBody.forVerify(int timestamp) {
    final body = '$_kTIPVerify${timestamp.toString().padLeft(32, '0')}';
    return TipBody._private(Uint8List.fromList(body.codeUnits));
  }

  factory TipBody.forRawTransactionCreate({
    required String assetId,
    required String opponentKey,
    required List<String> opponentReceivers,
    required int opponentThreshold,
    required String amount,
    String? traceId,
    String? memo,
  }) {
    var body = assetId + opponentKey;
    body += opponentReceivers.join();
    body =
        body +
        opponentThreshold.toString() +
        amount +
        (traceId ?? '') +
        (memo ?? '');
    return TipBody._private('$_kTIPRawTransactionCreate$body'.sha256());
  }

  factory TipBody.forWithdrawalCreate({
    required String addressId,
    required String amount,
    required String traceId,
    String? fee,
    String? memo,
  }) {
    final body =
        '$_kTIPWithdrawalCreate$addressId$amount${fee ?? ''}$traceId${memo ?? ''}';
    return TipBody._private(body.sha256());
  }

  factory TipBody.forTransfer({
    required String assetId,
    required String counterUserId,
    required String amount,
    String? traceId,
    String? memo,
  }) {
    final body =
        '$_kTIPTransferCreate$assetId$counterUserId$amount${traceId ?? ''}${memo ?? ''}';
    return TipBody._private(body.sha256());
  }

  factory TipBody.forPhoneNumberUpdate({
    required String verificationId,
    required String code,
  }) {
    final body = '$_kTIPPhoneNumberUpdate$verificationId$code';
    return TipBody._private(body.sha256());
  }

  factory TipBody.forEmergencyContactCreate({
    required String verificationId,
    required String code,
  }) {
    final body = '$_kTIPEmergencyContactCreate$verificationId$code';
    return TipBody._private(body.sha256());
  }

  factory TipBody.forAddressAdd({
    required String assetId,
    String? publicKey,
    String? keyTag,
    String? name,
  }) {
    final body =
        '$_kTIPAddressAdd$assetId${publicKey ?? ''}${keyTag ?? ''}${name ?? ''}';
    return TipBody._private(body.sha256());
  }

  factory TipBody.forAddressRemove(String addressId) {
    final body = '$_kTIPAddressRemove$addressId';
    return TipBody._private(body.sha256());
  }

  factory TipBody.forUserDeactivate(String phoneVerificationId) {
    final body = '$_kTIPUserDeactivate$phoneVerificationId';
    return TipBody._private(body.sha256());
  }

  factory TipBody.forEmergencyContactRead() {
    const body = '${_kTIPEmergencyContactRead}0';
    return TipBody._private(body.sha256());
  }

  factory TipBody.forEmergencyContactRemove() {
    const body = '${_kTIPEmergencyContactRemove}0';
    return TipBody._private(body.sha256());
  }

  factory TipBody.forMultisigRequestSign(String requestId) {
    final body = '$_kTIPMultisigRequestSign$requestId';
    return TipBody._private(body.sha256());
  }

  factory TipBody.forMultisigRequestUnlock(String requestId) {
    final body = '$_kTIPMultisigRequestUnlock$requestId';
    return TipBody._private(body.sha256());
  }

  factory TipBody.forCollectibleRequestSign(String requestId) {
    final body = '$_kTIPCollectibleRequestSign$requestId';
    return TipBody._private(body.sha256());
  }

  factory TipBody.forCollectibleRequestUnlock(String requestId) {
    final body = '$_kTIPCollectibleRequestUnlock$requestId';
    return TipBody._private(body.sha256());
  }

  factory TipBody.forOAuthApprove(String authorizationId) {
    final body = '$_kTIPOAuthApprove$authorizationId';
    return TipBody._private(body.sha256());
  }

  factory TipBody.forProvisioningCreate({
    required String id,
    required String secret,
  }) {
    final body = '$_kTIPProvisioningCreate$id$secret';
    return TipBody._private(body.sha256());
  }

  factory TipBody.forSequencerRegister({
    required String userId,
    required String publicKey,
  }) {
    final body = '$_kTIPBodyForSequencerRegister$userId$publicKey';
    return TipBody._private(body.sha256());
  }

  TipBody._private(this.bytes);

  static const String _kTIPVerify = 'TIP:VERIFY:';
  static const String _kTIPAddressAdd = 'TIP:ADDRESS:ADD:';
  static const String _kTIPAddressRemove = 'TIP:ADDRESS:REMOVE:';
  static const String _kTIPUserDeactivate = 'TIP:USER:DEACTIVATE:';
  static const String _kTIPEmergencyContactCreate =
      'TIP:EMERGENCY:CONTACT:CREATE:';
  static const String _kTIPEmergencyContactRead = 'TIP:EMERGENCY:CONTACT:READ:';
  static const String _kTIPEmergencyContactRemove =
      'TIP:EMERGENCY:CONTACT:REMOVE:';
  static const String _kTIPPhoneNumberUpdate = 'TIP:PHONE:NUMBER:UPDATE:';
  static const String _kTIPMultisigRequestSign = 'TIP:MULTISIG:REQUEST:SIGN:';
  static const String _kTIPMultisigRequestUnlock =
      'TIP:MULTISIG:REQUEST:UNLOCK:';
  static const String _kTIPCollectibleRequestSign =
      'TIP:COLLECTIBLE:REQUEST:SIGN:';
  static const String _kTIPCollectibleRequestUnlock =
      'TIP:COLLECTIBLE:REQUEST:UNLOCK:';
  static const String _kTIPTransferCreate = 'TIP:TRANSFER:CREATE:';
  static const String _kTIPWithdrawalCreate = 'TIP:WITHDRAWAL:CREATE:';
  static const String _kTIPRawTransactionCreate = 'TIP:TRANSACTION:CREATE:';
  static const String _kTIPOAuthApprove = 'TIP:OAUTH:APPROVE:';
  static const String _kTIPProvisioningCreate = 'TIP:PROVISIONING:UPDATE:';
  static const String _kTIPBodyForSequencerRegister = 'SEQUENCER:REGISTER:';

  final Uint8List bytes;
}
