import 'package:mixin_bot_sdk_dart/src/util/string_extension.dart';
import 'package:test/test.dart';

void main() {
  test('test text uuidHashcode', () {
    expect('ea91421a-98bb-41d2-abcf-af013d8b874b'.uuidHashcode(), -462541950);
    expect('0364f490-49cc-4988-88c2-481707687e5b'.uuidHashcode(), -989689004);
    expect('8df4972f-702f-4ae9-bc76-68e489351357'.uuidHashcode(), -929520011);
  });
}
