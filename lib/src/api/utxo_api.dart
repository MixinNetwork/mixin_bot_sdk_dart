import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';

class UtxoApi {
  UtxoApi({required this.dio});

  final Dio dio;

  /// https://developers.mixin.one/docs/api/safe-apis#get-utxo-list
  ///
  /// Because the new version of the API is just a proxy for the mainnet RPC,
  /// all operations are based on UTXO.
  ///
  /// A user, or a multi-signature group, wants to get their own asset situation,
  /// needs to access the UTXO list API to get all the UTXO and add them up to
  /// get the balance of the relevant asset account.
  ///
  /// [members] member user id list
  /// [offset] The offset of this API is not using time, because all UTXO
  /// in Mixin Sequencer have a unique numeric sequence number sequence,
  /// which can be used directly to sort more conveniently.
  Future<MixinResponse<List<SafeUtxoOutput>>> getOutputs({
    required List<String> members,
    required int threshold,
    int? offset,
    int limit = 500,
    String? state,
    String? asset,
  }) =>
      MixinResponse.requestList<SafeUtxoOutput>(
        dio.get(
          '/safe/outputs',
          queryParameters: {
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
    required String salt,
  }) =>
      MixinResponse.request<Account>(
        dio.post(
          '/safe/users',
          data: {
            'public_key': publicKey,
            'signature': signature,
            'pin_base64': pin,
            'salt_base64': salt,
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
  Future<MixinResponse<List<SafeGhostKey>>> ghostKey({
    required List<GhostKeyRequest> ghostKeyRequests,
  }) =>
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
}
