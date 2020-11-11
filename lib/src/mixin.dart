import 'package:meta/meta.dart';

class Mixin {
  factory Mixin() {
    assert(_instance != null,
        'Please make sure to call Mixin.init() at the top of your app or before using the other functions.');
    return _instance;
  }

  Mixin._(
      {@required this.userId,
      @required this.sessionId,
      @required this.privateKey});

  @visibleForTesting
  static void reset() {
    _instance = null;
  }

  static void init({
    @required String userId,
    @required String sessionId,
    @required String privateKey,
  }) {
    assert(userId != null);
    assert(sessionId != null);
    assert(privateKey != null);
    assert((_instance != null) || _instance == null,
        'Are you trying to reset the previous keys by calling Mixin.init() again?.');
    _instance =
        Mixin._(userId: userId, sessionId: sessionId, privateKey: privateKey);
  }

  static Mixin _instance;

  final String userId;
  final String sessionId;
  final String privateKey;
}
