@TestOn('vm')
library;

import 'package:dio/dio.dart';
import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:test/test.dart';

const _hash =
    'abababababababababababababababababababababababababababababababab';
const _token =
    'cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd';

Map<String, dynamic> _txResponse({
  String requestId = 'r',
  List<String>? views,
}) => {
  'type': 'transaction_request',
  'request_id': requestId,
  'user_id': 'u',
  'amount': '1',
  'transaction_hash': _hash,
  'asset': _hash,
  'senders_hash': '',
  'senders_threshold': 1,
  'senders': <String>[],
  'signers': <String>[],
  'extra': '',
  'state': 'unspent',
  'raw_transaction': '',
  'created_at': '',
  'updated_at': '',
  'snapshot_hash': '',
  'snapshot_at': '',
  'views': ?views,
};

Object? _answer(RequestOptions options) => switch (options.path) {
  '/safe/outputs' => {
    'data': [
      {
        'output_id': 'o',
        'transaction_hash': _hash,
        'output_index': 0,
        'asset': _hash,
        'sequence': 1,
        'amount': '1',
        'mask': '00' * 32,
        'keys': ['00' * 32],
        'receivers': ['u'],
        'receivers_hash': '',
        'receivers_threshold': 1,
        'extra': '',
        'state': 'unspent',
        'created_at': '',
        'updated_at': '',
        'signed_by': '',
        'signed_at': '',
        'spent_at': '',
      },
    ],
  },
  '/safe/keys' => {
    'data': [
      {
        'mask': '00' * 32,
        'keys': ['00' * 32],
      },
    ],
  },
  '/safe/transaction/requests' => {
    'data': [
      for (final (index, request)
          in (options.data as List<TransactionRequest>).indexed)
        _txResponse(requestId: request.requestId, views: ['view-$index']),
    ],
  },
  '/safe/transactions' => {
    'data': [_txResponse()],
  },
  '/safe/assets/$_hash' => {
    'data': {
      'asset_id': _hash,
      'kernel_asset_id': _hash,
      'symbol': 'T',
      'name': 'Token',
      'display_symbol': 'T',
      'display_name': 'Token',
      'icon_url': '',
      'price_btc': '0',
      'price_usd': '0',
      'chain_id': _hash,
      'change_usd': '0',
      'change_btc': '0',
      'confirmations': 1,
      'asset_key': '',
      'precision': 8,
      'dust': '0',
      'level': 1,
    },
  },
  '/safe/assets/$_token' => {
    'data': {
      'asset_id': _token,
      'kernel_asset_id': _token,
      'symbol': 'T',
      'name': 'Token',
      'display_symbol': 'T',
      'display_name': 'Token',
      'icon_url': '',
      'price_btc': '0',
      'price_usd': '0',
      'chain_id': _hash,
      'change_usd': '0',
      'change_btc': '0',
      'confirmations': 1,
      'asset_key': '',
      'precision': 8,
      'dust': '0',
      'level': 1,
    },
  },
  '/safe/assets/$_token/fees' => {
    'data': [
      {'type': 'fee', 'asset_id': _hash, 'amount': '1'},
    ],
  },
  '/safe/assets/$_hash/fees' => {
    'data': [
      {'type': 'fee', 'asset_id': _hash, 'amount': '0.5'},
    ],
  },
  _ => throw StateError('unexpected ${options.method} ${options.path}'),
};

class _Fixture {
  _Fixture() {
    final dio = Dio()
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            if (options.path == '/safe/transactions') {
              sentRaws.addAll(
                (options.data as List<TransactionRequest>).map((e) => e.raw),
              );
            }
            handler.resolve(
              Response(requestOptions: options, data: _answer(options)),
            );
          },
        ),
      );
    api = UtxoApi(
      AccountApi(dio: dio),
      TokenApi(dio: dio),
      dio: dio,
    );
  }

  late final UtxoApi api;
  final sentRaws = <String>[];
  final seenViews = <List<String>>[];
  final spendKey = Key.froHex('11' * 64);

  Future<String> signer({
    required SafeTransaction tx,
    required List<SafeUtxoOutput> utxos,
    required List<String> views,
    required Key privateKey,
  }) async {
    seenViews.add(views);
    return 'signed-by-app';
  }
}

void main() {
  test('transactionToUser signs through the supplied signer', () async {
    final fixture = _Fixture();
    await fixture.api.transactionToUser(
      receiverIds: ['r'],
      amount: '1',
      asset: _hash,
      spendKey: fixture.spendKey,
      signer: fixture.signer,
    );
    expect(fixture.sentRaws, ['signed-by-app']);
    expect(fixture.seenViews, [
      ['view-0'],
    ]);
  });

  test('transactionToMixAddress signs through the supplied signer', () async {
    final fixture = _Fixture();
    await fixture.api.transactionToMixAddress(
      address: MixAddress.fromUuid(['r'], 1),
      amount: '1',
      asset: _hash,
      spendKey: fixture.spendKey,
      signer: fixture.signer,
    );
    expect(fixture.sentRaws, ['signed-by-app']);
    expect(fixture.seenViews, [
      ['view-0'],
    ]);
  });

  test('withdrawalToAddress signs through the supplied signer', () async {
    final fixture = _Fixture();
    await fixture.api.withdrawalToAddress(
      asset: _hash,
      destination: 'destination',
      spendKey: fixture.spendKey,
      amount: '0.5',
      signer: fixture.signer,
    );
    expect(fixture.sentRaws, ['signed-by-app']);
    expect(fixture.seenViews, [
      ['view-0'],
    ]);
  });

  test('withdrawalToAddress signs both transactions through the supplied '
      'signer when the fee asset differs', () async {
    final fixture = _Fixture();
    await fixture.api.withdrawalToAddress(
      asset: _token,
      destination: 'destination',
      spendKey: fixture.spendKey,
      amount: '1',
      signer: fixture.signer,
    );
    expect(fixture.sentRaws, ['signed-by-app', 'signed-by-app']);
    expect(fixture.seenViews, [
      ['view-0'],
      ['view-1'],
    ]);
  });
}
