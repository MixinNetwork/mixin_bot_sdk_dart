import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:test/test.dart';

void main() {
  test('Test for safe transaction signature', () {
    const raw1 =
        '77770005b9f49cf777dc4d03bc54cd1367eebca319f8603ea1ce18910d09e2c540c630d80001c513ffcc684e9585c76bd76245aa7d2def3b9f147422b59ab91db7852c9d97dd000000000000000000010000000405f5e1000001a6c306c3137c2bf4a8bfc95ea5165f7777020916aa36ee6ec394beb9a1e6a164286d4f092015ea327ba12145edd40ddede1bdd80f777c249128d38176e352a130003fffe010000000000000009746573742d6d656d6f0000';
    const raw2 =
        '77770005b9f49cf777dc4d03bc54cd1367eebca319f8603ea1ce18910d09e2c540c630d80001c513ffcc684e9585c76bd76245aa7d2def3b9f147422b59ab91db7852c9d97dd000000000000000000010000000405f5e1000001a6c306c3137c2bf4a8bfc95ea5165f7777020916aa36ee6ec394beb9a1e6a164286d4f092015ea327ba12145edd40ddede1bdd80f777c249128d38176e352a130003fffe010000000000000009746573742d6d656d6f000100010000fde63b999d519394b3ba8a99a9f1d44bc91c2ee73d472d2085fa222925732889159042b126b4436766d6d3308ee541c50fc1b9b8b83701ac534c68e7f4d0f50c';
    const views = [
      '0164ba23d5aa1953132bc0bf5d12d0af7e66de2ba8773701ef135e015f24bb0b'
    ];
    final priv = Key.froHex(
        '7fb3893475a82c85e2b3c8a9a9232eddb36651ac32fa98ae83e6c2f33fb1be84dea64fa32b3b01f9a059142c0e9535a57b69f676790ae64f6d52f9a06d90f11e');

    final tx = SafeTransaction(
      asset: 'b9f49cf777dc4d03bc54cd1367eebca319f8603ea1ce18910d09e2c540c630d8',
      extra: 'test-memo',
      inputs: [
        Input(
          hash:
              'c513ffcc684e9585c76bd76245aa7d2def3b9f147422b59ab91db7852c9d97dd',
          index: 0,
        ),
      ],
      outputs: [
        Output(
          type: OutputType.script,
          amount: '1',
          keys: [
            'a6c306c3137c2bf4a8bfc95ea5165f7777020916aa36ee6ec394beb9a1e6a164'
          ],
          mask:
              '286d4f092015ea327ba12145edd40ddede1bdd80f777c249128d38176e352a13',
          script: 'fffe01',
        ),
      ],
    );
    final unsignedRaw = encodeSafeTransaction(tx);
    expect(unsignedRaw, raw1);

    const utxos = [
      SafeUtxoOutput(
        keys: [
          '0b6c1f0d107d9b825b48d2dcd711993ad5e6b0b06501adce5db767711e97551b',
          'e0d29cfc66eee800fe3fc2329fd49a93cb11006675fa39db6e64739a79d611ba'
        ],
        outputIndex: 0,
        transactionHash:
            'c513ffcc684e9585c76bd76245aa7d2def3b9f147422b59ab91db7852c9d97dd',
        mask: '',
        outputId: '',
        asset: '',
        sequence: 0,
        amount: '1',
        receivers: [],
        receiversHash: '',
        receiversThreshold: 0,
        extra: '',
        state: '',
        createdAt: '',
        updatedAt: '',
        signedBy: '',
        signedAt: '',
        spentAt: '',
      ),
    ];

    final signedRaw = signSafeTransaction(
        tx: tx, utxos: utxos, views: views, privateKey: priv);
    expect(signedRaw, raw2);
  });
}
