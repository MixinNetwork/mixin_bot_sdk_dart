// Get APP data from https://developers.mixin.one/dashboard
import 'package:mixin_bot_sdk_dart/src/vo/participant_request.dart';
import 'package:mixin_bot_sdk_dart/src/vo/relationship_request.dart';

final uid = '2caa4dc4-7c6f-4957-a95c-192ef4329be5';
final sid = '2a2cd5ea-d366-4941-adc1-9f0950b69990';
final private =
    'vgvxnjFLrk21mZ12YKp5gnfzORrQMVNVF11lgnzVbqtgvJL96jlfFOCqNSG3Cgxfx9Dm7yokR5ZIZgLPqKMr6A==';

final uids = <String>['773e5e77-4107-45c2-b648-8fc722ed77f5'];

var mockRelationshipRequest = RelationshipRequest(
    userId: '773e5e77-4107-45c2-b648-8fc722ed77f5',
    action: RelationshipAction.add.toString());
