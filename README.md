# mixin_bot_sdk_dart

Dart/Flutter SDK for Mixin Bot

[Pub package](https://pub.dev/packages/mixin_bot_sdk_dart)

## Usage

See [test/](https://github.com/MixinNetwork/mixin_bot_sdk_dart/tree/master/test) for variety of examples.

**Quick Start**
```dart
import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';

final client = Client(
      userId: uid,
      sessionId: sid,
      privateKey: private,
);

try {
  final resp = await client.accountApi.getMe();
  print(resp.data.toJson());
} catch (e) {
  if (e is MixinApiError) {
    print(e.error);
  }
}
```