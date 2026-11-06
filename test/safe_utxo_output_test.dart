import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:test/test.dart';

Map<String, dynamic> _json([Map<String, dynamic> extra = const {}]) => {
  'output_id': 'o',
  'transaction_hash': 'h',
  'output_index': 0,
  'asset': 'a',
  'sequence': 1,
  'amount': '1',
  'mask': '',
  'keys': <String>[],
  'receivers': <String>[],
  'receivers_hash': '',
  'receivers_threshold': 1,
  'extra': '',
  'state': 'unspent',
  'created_at': '',
  'updated_at': '',
  'signed_by': '',
  'signed_at': '',
  'spent_at': '',
  ...extra,
};

void main() {
  test('reads inscription_hash', () {
    final output = SafeUtxoOutput.fromJson(_json({'inscription_hash': 'i'}));
    expect(output.inscriptionHash, 'i');
  });

  test('inscription_hash is null when the response does not have it', () {
    expect(SafeUtxoOutput.fromJson(_json()).inscriptionHash, isNull);
  });
}
