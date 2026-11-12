import 'dart:async';
import 'dart:isolate';

import '../../mixin_bot_sdk_dart.dart';

Future<_Signer>? _signer;

class _Signer {
  _Signer(this.requests);

  final SendPort requests;
  final Set<SendPort> pendingReplies = {};
  bool hasExited = false;
}

Future<String> signOnSignerIsolate({
  required SafeTransaction tx,
  required List<SafeUtxoOutput> utxos,
  required List<String> views,
  required Key privateKey,
}) async {
  final signer = await (_signer ??= _spawnSigner());
  if (signer.hasExited) throw _signerExited();
  final reply = ReceivePort();
  final Object? response;
  try {
    signer.pendingReplies.add(reply.sendPort);
    signer.requests.send((tx, utxos, views, privateKey, reply.sendPort));
    response = await reply.first;
  } finally {
    signer.pendingReplies.remove(reply.sendPort);
    reply.close();
  }
  if (response == null) throw _signerExited();
  final (signedRaw, error, stackTrace) =
      response as (String?, Object?, String?);
  if (error != null) {
    Error.throwWithStackTrace(error, StackTrace.fromString(stackTrace ?? ''));
  }
  return signedRaw!;
}

StateError _signerExited() =>
    StateError('The safe transaction signer isolate exited.');

Future<_Signer> _spawnSigner() {
  final ready = Completer<_Signer>();
  final control = RawReceivePort();

  void onExit([Object? error, StackTrace? stackTrace]) {
    control.close();
    if (identical(_signer, ready.future)) _signer = null;
    if (!ready.isCompleted) {
      ready.completeError(error ?? _signerExited(), stackTrace);
    }
  }

  _Signer? signer;
  void onMessage(Object? message) {
    if (message is SendPort) {
      control.keepIsolateAlive = false;
      signer = _Signer(message);
      ready.complete(signer);
      return;
    }
    onExit();
    signer?.hasExited = true;
    for (final reply in [...?signer?.pendingReplies]) {
      reply.send(null);
    }
  }

  control.handler = onMessage;
  unawaited(
    Isolate.spawn(
      _runSigner,
      (control.sendPort, Isolate.current),
      onExit: control.sendPort,
      debugName: 'safe transaction signer',
    ).then<void>((_) {}, onError: onExit),
  );
  return ready.future;
}

/// Sends the port this isolate takes requests on to `ready`, then answers
/// each request with its signed raw transaction or its error.
void _runSigner((SendPort, Isolate) args) {
  final (ready, parent) = args;
  final requests = ReceivePort();
  final parentExit = RawReceivePort((_) {
    requests.close();
  });
  parent.addOnExitListener(parentExit.sendPort);
  ready.send(requests.sendPort);
  requests.listen(
    (message) {
      final (tx, utxos, views, privateKey, reply) =
          message
              as (
                SafeTransaction,
                List<SafeUtxoOutput>,
                List<String>,
                Key,
                SendPort,
              );
      try {
        reply.send((
          signSafeTransaction(
            tx: tx,
            utxos: utxos,
            views: views,
            privateKey: privateKey,
          ),
          null,
          null,
        ));
      } catch (error, stackTrace) {
        try {
          reply.send((null, error, stackTrace.toString()));
        } catch (_) {
          reply.send((
            null,
            RemoteError(error.toString(), stackTrace.toString()),
            stackTrace.toString(),
          ));
        }
      }
    },
    onDone: parentExit.close,
  );
}
