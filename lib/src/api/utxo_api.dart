import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;
import 'package:thirds/blake3.dart';
import 'package:uuid/uuid.dart';

import '../../mixin_bot_sdk_dart.dart';

const _kLimit = 500;

class UtxoApi {
  UtxoApi(this._accountApi, this._tokenApi, {required this.dio});

  final Dio dio;
  final AccountApi _accountApi;
  final TokenApi _tokenApi;

  /// https://developers.mixin.one/docs/api/safe-apis#get-utxo-list
  ///
  /// Because the new version of the API is just a proxy for the mainnet RPC,
  /// all operations are based on UTXO.
  ///
  /// A user, or a multi-signature group, wants to get their own asset situation,
  /// needs to access the UTXO list API to get all the UTXO and add them up to
  /// get the balance of the relevant asset account.
  ///
  /// [members] member user id list. null or empty for current user.
  /// [offset] The offset of this API is not using time, because all UTXO
  /// in Mixin Sequencer have a unique numeric sequence number sequence,
  /// which can be used directly to sort more conveniently.
  Future<MixinResponse<List<SafeUtxoOutput>>> getOutputs({
    required int threshold,
    List<String>? members,
    int? offset,
    int limit = _kLimit,
    String? state,
    String? asset,
  }) =>
      MixinResponse.requestList<SafeUtxoOutput>(
        dio.get(
          '/safe/outputs',
          queryParameters: {
            if (members != null && members.isNotEmpty)
              'members': hashMembers(members),
            'threshold': threshold,
            'offset': offset,
            'limit': limit,
            'state': state,
            'asset': asset,
          },
        ),
        SafeUtxoOutput.fromJson,
      );

  /// https://developers.mixin.one/docs/api/safe-apis#get-a-recharge-address
  ///
  /// The new version of the API can give any user,
  /// including a multi-signature group, a recharge address.
  ///
  /// For now, a user or a multi-signature group can only get one address,
  /// and repeated requests will get the same address.
  Future<MixinResponse<List<DepositEntry>>> createDeposit({
    required String chainId,
    List<String>? members,
    int? threshold,
  }) =>
      MixinResponse.requestList<DepositEntry>(
        dio.post(
          '/safe/deposit/entries',
          data: {
            'chain_id': chainId,
            if (members != null) 'members': members,
            if (threshold != null) 'threshold': threshold,
          },
        ),
        DepositEntry.fromJson,
      );

  /// https://developers.mixin.one/docs/api/safe-apis#register-user
  ///
  /// Register user No matter if it is a new user or an old user,
  /// they are all unregistered users in front of the new version of the API,
  /// and they need to use the following API to register.
  ///
  /// [publicKey] Ed25519 public key hex
  /// [signature] Ed25519 signature of user uuid hex
  /// [pin] tip pin base64
  Future<MixinResponse<Account>> registerPublicKey({
    required String publicKey,
    required String signature,
    required String pin,
  }) =>
      MixinResponse.request<Account>(
        dio.post(
          '/safe/users',
          data: {
            'public_key': publicKey,
            'signature': signature,
            'pin_base64': pin,
          },
        ),
        Account.fromJson,
      );

  /// https://developers.mixin.one/docs/api/safe-apis#get-payment-information
  ///
  /// If it is a withdrawal or directly transfer the assets to a Mixin Kernel address,
  /// this step is not required.
  ///
  /// Only when you want to transfer assets to a registered user or multi-signature
  /// group of Sequencer, you need to get the one-time payment information
  /// of the other party through this API.
  Future<MixinResponse<List<SafeGhostKey>>> ghostKey(
    List<GhostKeyRequest> ghostKeyRequests,
  ) =>
      MixinResponse.requestList<SafeGhostKey>(
        dio.post(
          '/safe/keys',
          data: ghostKeyRequests,
        ),
        SafeGhostKey.fromJson,
      );

  /// https://developers.mixin.one/docs/api/safe-apis#verify-transaction-format
  ///
  /// Regardless of whether the recipient is a Sequencer user,
  /// after the transaction is constructed, you need to send the transaction to
  /// Sequencer to verify that the transaction format is correct,
  /// and Sequencer will return the corresponding view key signature.
  ///
  /// The successfully returned views array is exactly the view key part signature
  /// corresponding to each input in order.
  ///
  /// Note that both the input and output of this API are arrays,
  /// which is for the convenience of batch verification of transactions.
  Future<MixinResponse<List<TransactionResponse>>> transactionRequest(
    List<TransactionRequest> transactionRequests,
  ) =>
      MixinResponse.requestList<TransactionResponse>(
        dio.post(
          '/safe/transaction/requests',
          data: transactionRequests,
        ),
        TransactionResponse.fromJson,
      );

  /// https://developers.mixin.one/docs/api/safe-apis#sign-and-send-transaction
  ///
  /// After receiving the view key signature from Sequencer,
  /// the client can use their own ed25519 private key to perform the second
  /// formal signature, and the specific code of the signature can be operated
  /// using the relevant SDK.
  ///
  /// At this time, the entire transaction is considered to be completely constructed,
  /// and then it can be sent out through the following API.
  ///
  /// Note that this transaction can be sent directly through the Mixin Kernel mainnet RPC,
  /// but we do not recommend this operation, because if it is sent directly,
  /// Sequencer cannot correctly index this transaction and cannot provide transaction
  /// and snapshot query services.
  Future<MixinResponse<List<TransactionResponse>>> transactions(
    List<TransactionRequest> transactionRequests,
  ) =>
      MixinResponse.requestList<TransactionResponse>(
        dio.post(
          '/safe/transactions',
          data: transactionRequests,
        ),
        TransactionResponse.fromJson,
      );

  /// https://developers.mixin.one/docs/api/safe-apis#query-transaction
  ///
  /// After the transaction is correctly sent out through the Sequencer API,
  /// you can query the transaction status through the request UUID.
  Future<MixinResponse<TransactionResponse>> getTransactionsById({
    required String id,
  }) =>
      MixinResponse.request<TransactionResponse>(
        dio.get(
          '/safe/transactions/$id',
        ),
        TransactionResponse.fromJson,
      );

  Future<MixinResponse<TransactionResponse>> getMultisigs(String requestId) =>
      MixinResponse.request<TransactionResponse>(
        dio.get(
          '/safe/multisigs/$requestId',
        ),
        TransactionResponse.fromJson,
      );

  Future<MixinResponse<TransactionResponse>> signTransactionMultisigs(
    String requestId,
    TransactionRequest request,
  ) =>
      MixinResponse.request<TransactionResponse>(
        dio.post(
          '/safe/multisigs/$requestId/sign',
          data: request.toJson(),
        ),
        TransactionResponse.fromJson,
      );

  Future<MixinResponse<TransactionResponse>> unlockTransactionMultisigs(
          String requestId) =>
      MixinResponse.request<TransactionResponse>(
        dio.post(
          '/safe/multisigs/$requestId/unlock',
        ),
        TransactionResponse.fromJson,
      );

  Future<String> assetBalance({
    required String assetId,
    required int threshold,
    List<String>? members,
  }) async {
    final outputs = <SafeUtxoOutput>[];
    int? latestSequence;
    while (true) {
      final data = (await getOutputs(
        members: members,
        threshold: threshold,
        asset: assetId,
        state: OutputState.unspent.name,
        offset: latestSequence == null ? null : latestSequence + 1,
      ))
          .data;
      outputs.addAll(data);
      if (data.length < _kLimit) {
        break;
      }
      latestSequence = data.last.sequence;
    }
    final balance = outputs.fold(
      Decimal.zero,
      (previousValue, element) => previousValue + Decimal.parse(element.amount),
    );
    return balance.toString();
  }

  Future<(List<SafeUtxoOutput>, Decimal)> _getEnoughOutputsForTransaction({
    required String asset,
    required int threshold,
    required Decimal desiredAmount,
    List<String> members = const [],
  }) async {
    int? latestSequence;
    final outputs = <SafeUtxoOutput>[];
    var outputsAmount = Decimal.zero;
    while (true) {
      const limit = 100;
      final data = (await getOutputs(
        threshold: threshold,
        asset: asset,
        state: OutputState.unspent.name,
        members: members,
        limit: limit,
        offset: latestSequence == null ? null : latestSequence + 1,
      ))
          .data;
      latestSequence = data.lastOrNull?.sequence;
      final noMoreOutputs = data.length < limit;
      final (amount, candidates) =
          getUnspentOutputsForTransaction(data, desiredAmount);
      outputsAmount += amount;
      outputs.addAll(candidates);

      if (outputsAmount >= desiredAmount || noMoreOutputs) {
        break;
      }
      assert(latestSequence != null, 'latestSequence is null');
    }
    if (outputsAmount < desiredAmount) {
      throw NotEnoughOutputsException();
    }
    assert(() {
      final outputIds = outputs.map((e) => e.outputId).toSet();
      assert(outputIds.length == outputs.length, 'outputs is not unique.');
      return true;
    }(), 'check outputs if valid');

    const maxUtxoCount = 256;
    if (outputs.length >= maxUtxoCount) {
      throw MaxCountNotEnoughUtxoException();
    }

    return (outputs, outputsAmount - desiredAmount);
  }

  /// Send a tx to mixin user.
  ///
  /// [receiverIds] destination user uuid list
  /// [senderIds] sender user uuid list
  ///
  /// [spendKey] spend key hex
  ///
  Future<List<TransactionResponse>> transactionToUser({
    required List<String> receiverIds,
    required String amount,
    required String asset,
    required String spendKey,
    List<String> senderIds = const [],
    int threshold = 1,
    String? memo,
  }) async {
    assert(receiverIds.isNotEmpty, 'receiverIds is empty');
    receiverIds = receiverIds.toList()..sort();

    final (utxos, change) = await _getEnoughOutputsForTransaction(
      asset: asset,
      threshold: threshold,
      desiredAmount: Decimal.parse(amount),
      members: senderIds,
    );

    final recipients = [
      UserTransactionRecipient(
        members: receiverIds,
        threshold: threshold,
        amount: amount,
      ),
      if (change > Decimal.zero)
        // change
        UserTransactionRecipient(
          members: utxos[0].receivers,
          threshold: utxos[0].receiversThreshold,
          amount: change.toString(),
        ),
    ];

    final ghosts = (await ghostKey(
      recipients
          .mapIndexed(
            (index, e) => GhostKeyRequest(
              receivers: e.members,
              hint: const Uuid().v4(),
              index: index,
            ),
          )
          .toList(),
    ))
        .data;

    final tx = buildSafeTransaction(
      utxos: utxos,
      rs: recipients,
      gs: ghosts,
      extra: memo ?? '',
    );
    // verify safe transaction
    final raw = encodeSafeTransaction(tx);
    final requestId = const Uuid().v4();
    final verifiedTx = (await transactionRequest(
      [
        TransactionRequest(
          requestId: requestId,
          raw: raw,
        )
      ],
    ))
        .data
        .first;

    // sign safe transaction with the private key registered in the safe
    final signedRaw = signSafeTransaction(
      tx: tx,
      utxos: utxos,
      views: verifiedTx.views!,
      privateKey: spendKey,
    );

    final sentTx = await transactions(
      [TransactionRequest(raw: signedRaw, requestId: requestId)],
    );
    return sentTx.data;
  }

  Future<Account> registerSafe({
    required String userId,
    required Uint8List tipPrivateKey,
    required String pinTokenBase64,
    required String sessionPrivateKeyBase64,
  }) async {
    final safePublicKeyHex =
        ed.public(ed.PrivateKey(tipPrivateKey)).bytes.toHexString();

    final me = (await _accountApi.getMe()).data;
    if (me.hasSafe) {
      // already has safe.
      return me;
    }

    final pin = encryptTipPin(
      pinTokenBase64: pinTokenBase64,
      privateKeyBase64: sessionPrivateKeyBase64,
      signTarget: TipBody.forSequencerRegister(
              userId: userId, publicKey: safePublicKeyHex)
          .bytes,
      tipPrivateKey: tipPrivateKey,
    );

    final signature = ed
        .sign(ed.PrivateKey(tipPrivateKey), userId.sha3Hash())
        .base64RawUrlEncode();

    final response = await registerPublicKey(
      publicKey: safePublicKeyHex,
      signature: signature,
      pin: pin,
    );
    return response.data;
  }

  Future<List<TransactionResponse>> withdrawalToAddress({
    required String asset,
    required String destination,
    required String spendKey,
    required String amount,
    String? tag,
    String? memo,
  }) async {
    final token = (await _tokenApi.getAssetById(asset)).data;
    final chain = token.chainId == token.assetId
        ? token
        : (await _tokenApi.getAssetById(token.chainId)).data;

    final feeResponse =
        (await _tokenApi.getFees(asset: asset, destination: destination)).data;
    final fee = feeResponse
        .firstWhereOrNull((element) => element.assetId == chain.assetId);
    if (fee == null) {
      throw Exception('fee not found: $asset $feeResponse');
    }

    const mixinFeeUserId = '674d6776-d600-4346-af46-58e77d8df185';

    return _withdrawTransaction(
      feeReceiverId: mixinFeeUserId,
      feeAsset: chain.assetId,
      feeAmount: Decimal.parse(fee.amount),
      asset: asset,
      amount: Decimal.parse(amount),
      destination: destination,
      tag: tag,
      spendKey: spendKey,
    );
  }

  Future<List<TransactionResponse>> _withdrawTransaction({
    required String feeReceiverId,
    required String feeAsset,
    required Decimal feeAmount,
    required String asset,
    required Decimal amount,
    required String destination,
    required String? tag,
    required String spendKey,
    int threshold = 1,
    String? memo,
  }) async {
    final isFeeDifferenceAsset = feeAsset != asset;

    if (isFeeDifferenceAsset) {
      final (utxos, change) = await _getEnoughOutputsForTransaction(
        asset: asset,
        threshold: threshold,
        desiredAmount: amount,
      );

      final (feeUtxos, feeChange) = await _getEnoughOutputsForTransaction(
        asset: feeAsset,
        threshold: threshold,
        desiredAmount: feeAmount,
      );

      final ghosts = (await ghostKey([
        // fee
        GhostKeyRequest(
            receivers: [feeReceiverId], hint: const Uuid().v4(), index: 0),
        // change
        if (change > Decimal.zero)
          GhostKeyRequest(
              receivers: utxos[0].receivers, hint: const Uuid().v4(), index: 1),
        // fee change
        if (feeChange > Decimal.zero)
          GhostKeyRequest(
            receivers: feeUtxos[0].receivers,
            hint: const Uuid().v4(),
            index: 1,
          ),
      ]))
          .data;

      final feeGhostKey = ghosts[0];
      final changeGhostKey = (change > Decimal.zero) ? ghosts[1] : null;
      final feeChangeGhostKey = (feeChange > Decimal.zero)
          ? ((change > Decimal.zero) ? ghosts[2] : ghosts[1])
          : null;

      final withdrawalTx = buildSafeTransaction(
        utxos: utxos,
        rs: [
          WithdrawalTransactionRecipient(
            destination: destination,
            tag: tag,
            amount: amount.toString(),
          ),
          if (change > Decimal.zero)
            UserTransactionRecipient(
              members: utxos[0].receivers,
              threshold: utxos[0].receiversThreshold,
              amount: change.toString(),
            ),
        ],
        gs: [
          null /* first is for withdrawal */,
          if (change > Decimal.zero) changeGhostKey!,
        ],
        extra: memo ?? '',
      );
      final withdrawTxRaw = encodeSafeTransaction(withdrawalTx);

      final feeTx = buildSafeTransaction(
        utxos: feeUtxos,
        rs: [
          UserTransactionRecipient(
            members: [feeReceiverId],
            threshold: threshold,
            amount: feeAmount.toString(),
          ),
          if (feeChange > Decimal.zero)
            UserTransactionRecipient(
              members: feeUtxos[0].receivers,
              threshold: feeUtxos[0].receiversThreshold,
              amount: feeChange.toString(),
            ),
        ],
        gs: [
          feeGhostKey,
          if (feeChange > Decimal.zero) feeChangeGhostKey!,
        ],
        extra: memo ?? '',
        reference: blake3Hex(withdrawTxRaw.hexToBytes()),
      );
      final feeTxRaw = encodeSafeTransaction(feeTx);

      final withdrawalRequestId = const Uuid().v4();
      final feeRequestId = const Uuid().v4();
      final requestResponse = (await transactionRequest([
        TransactionRequest(requestId: withdrawalRequestId, raw: withdrawTxRaw),
        TransactionRequest(requestId: feeRequestId, raw: feeTxRaw),
      ]))
          .data;
      if (requestResponse.isEmpty) {
        throw Exception('Parameter exception');
      } else if (requestResponse.first.state != OutputState.unspent.name) {
        throw Exception('Transfer is already paid');
      }

      final withdrawalData = requestResponse
          .firstWhere((element) => element.requestId == withdrawalRequestId);
      final feeData = requestResponse
          .firstWhere((element) => element.requestId == feeRequestId);

      final singedWithdrawalRaw = signSafeTransaction(
        tx: withdrawalTx,
        utxos: utxos,
        views: withdrawalData.views!,
        privateKey: spendKey,
      );
      final singedFeeRaw = signSafeTransaction(
        tx: feeTx,
        utxos: feeUtxos,
        views: feeData.views!,
        privateKey: spendKey,
      );
      final sentTx = await transactions([
        TransactionRequest(
            raw: singedWithdrawalRaw, requestId: withdrawalRequestId),
        TransactionRequest(raw: singedFeeRaw, requestId: feeRequestId),
      ]);
      return sentTx.data;
    } else {
      final (utxos, change) = await _getEnoughOutputsForTransaction(
        asset: asset,
        threshold: threshold,
        desiredAmount: amount + feeAmount,
      );

      final ghosts = (await ghostKey([
        // fee
        GhostKeyRequest(
            receivers: [feeReceiverId], hint: const Uuid().v4(), index: 1),
        // fee change
        if (change > Decimal.zero)
          GhostKeyRequest(
              receivers: utxos[0].receivers, hint: const Uuid().v4(), index: 2),
      ]))
          .data;

      final tx = buildSafeTransaction(
        utxos: utxos,
        rs: [
          WithdrawalTransactionRecipient(
            destination: destination,
            tag: tag,
            amount: amount.toString(),
          ),
          UserTransactionRecipient(
            members: [feeReceiverId],
            threshold: threshold,
            amount: feeAmount.toString(),
          ),
          if (change > Decimal.zero)
            UserTransactionRecipient(
              members: utxos[0].receivers,
              threshold: utxos[0].receiversThreshold,
              amount: change.toString(),
            ),
        ],
        gs: [null /* first is for withdrawal */, ...ghosts],
        extra: memo ?? '',
      );

      final raw = encodeSafeTransaction(tx);
      final requestId = const Uuid().v4();
      final verifiedTx = (await transactionRequest(
        [TransactionRequest(requestId: requestId, raw: raw)],
      ))
          .data
          .first;
      final signedRaw = signSafeTransaction(
        tx: tx,
        utxos: utxos,
        views: verifiedTx.views!,
        privateKey: spendKey,
      );
      final sentTx = await transactions(
        [TransactionRequest(raw: signedRaw, requestId: requestId)],
      );
      return sentTx.data;
    }
  }

  Future<List<TransactionResponse>> transactionToMixAddress({
    required MixAddress address,
    required String amount,
    required String spendKey,
    required String asset,
  }) async {
    assert(address.members.isNotEmpty, 'members is empty');
    switch (address.memberType) {
      case MixMemberType.uuid:
        return transactionToUser(
          receiverIds: address.members,
          amount: amount,
          asset: asset,
          spendKey: spendKey,
        );
      case MixMemberType.xin:
        assert(address.members.length == 1, 'members length is not 1');
        throw UnimplementedError();
    }
  }
}
