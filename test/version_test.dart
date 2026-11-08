import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:test/test.dart';

void main() {
  test('sdkVersion matches pubspec.yaml', () {
    final pubspec = File('pubspec.yaml').readAsStringSync();
    final version = RegExp(
      r'^version:\s*(\S+)',
      multiLine: true,
    ).firstMatch(pubspec)!.group(1);
    expect(sdkVersion, version);
  });

  test('Client sends the default User-Agent', () {
    final client = Client(accessToken: 'token', httpLogLevel: null);
    expect(client.dio.options.headers['User-Agent'], defaultUserAgent);
  });

  test('User-Agent from dioOptions takes precedence', () {
    final client = Client(
      accessToken: 'token',
      httpLogLevel: null,
      dioOptions: BaseOptions(headers: {'user-agent': 'custom/1.0'}),
    );
    expect(client.dio.options.headers['User-Agent'], 'custom/1.0');
  });
}
