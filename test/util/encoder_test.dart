import 'package:mixin_bot_sdk_dart/src/util/encoder.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('encoder signature', () {
    final encoder = Encoder()
      ..encodeSignature(
        {
          0: 'fde63b999d519394b3ba8a99a9f1d44bc91c2ee73d472d2085fa222925732889159042b126b4436766d6d3308ee541c50fc1b9b8b83701ac534c68e7f4d0f50c',
        },
      );
    expect(
      encoder.toHex(),
      '00010000fde63b999d519394b3ba8a99a9f1d44bc91c2ee73d472d2085fa222925732889159042b126b4436766d6d3308ee541c50fc1b9b8b83701ac534c68e7f4d0f50c',
    );
  });
}
