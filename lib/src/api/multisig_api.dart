import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';
import '../vo/multisigs_utxo_response.dart';

class MultisigApi {
  MultisigApi({required this.dio});

  final Dio dio;

  /// state: spent | unspent | signed
  Future<MixinResponse<List<MultisigsUTXOResponse>>> read({
    required List<String> members,
    required int threshold,
    String? state,
    int? limit,
    int? offset,
  }) {
    if (members.isEmpty || threshold < 1 || threshold > members.length) {
      throw Exception('Invalid threshold or members');
    }

    final membersHash = sha256.convert(members.join().codeUnits).toString();

    return MixinResponse.requestList<MultisigsUTXOResponse>(
      dio.get('/multisigs/outputs', queryParameters: <String, dynamic>{
        'members': membersHash,
        'threshold': threshold,
        if (state != null) 'state': state,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
      }),
      MultisigsUTXOResponse.fromJson,
    );
  }

  /// CreateMultisig create a multisigs request which action is `unlock` or `sign`
  Future<MixinResponse<MultisigsResponse>> create({
    required String action,
    required String raw,
  }) =>
      MixinResponse.request<MultisigsResponse>(
        dio.post('/multisigs/requests', data: {
          'action': action,
          'raw': raw,
        }),
        MultisigsResponse.fromJson,
      );

  Future<MixinResponse<MultisigsResponse>> sign(String id, String pin) =>
      MixinResponse.request<MultisigsResponse>(
        dio.post('/multisigs/requests/$id/sign', data: {'pin_base64': pin}),
        MultisigsResponse.fromJson,
      );

  Future<MixinResponse<MultisigsResponse>> unlock(String id, String pin) =>
      MixinResponse.request<MultisigsResponse>(
        dio.post('/multisigs/requests/$id/unlock', data: {'pin_base64': pin}),
        MultisigsResponse.fromJson,
      );

  Future<MixinResponse<MultisigsResponse>> cancel(String id) =>
      MixinResponse.request<MultisigsResponse>(
        dio.post('/multisigs/requests/$id/cancel'),
        MultisigsResponse.fromJson,
      );

  Future<MixinResponse<MultisigsResponse>> transaction(
          RawTransactionRequest request) =>
      MixinResponse.request<MultisigsResponse>(
        dio.post('/transactions', data: request),
        MultisigsResponse.fromJson,
      );
}
