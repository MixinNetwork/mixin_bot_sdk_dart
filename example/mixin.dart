import 'dart:convert';
import 'package:cryptography/cryptography.dart';
import 'package:convert/convert.dart';
import 'package:jose/jose.dart';
import '../lib/bot_api_dart_client.dart';
import './config.dart';



void main() {
  signAuthenticationToken(uid, sid, private, 'GET', '/me', '').then((String token) {
    print(token);
  });
}
