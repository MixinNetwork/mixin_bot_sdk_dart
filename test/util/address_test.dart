import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:test/test.dart';

void main() {
  test('test 1', () {
    final members = ['67a87828-18f5-46a1-b6cc-c72a97a77c43'];
    final address = MixAddress(members: members, threshold: 1).toAddress();
    expect('MIX3QEeg1WkLrjvjxyMQf6Xc8dxs81tpPc', address);

    final ma = MixAddress.parse('MIX3QEeg1WkLrjvjxyMQf6Xc8dxs81tpPc');
    expect(ma, isNotNull);
    expect(ma.members.join(','), members.join(','));
    expect(ma.threshold, 1);
  });

  test('test 2', () {
    final members = [
      '67a87828-18f5-46a1-b6cc-c72a97a77c43',
      'c94ac88f-4671-3976-b60a-09064f1811e8',
      'c6d0c728-2624-429b-8e0d-d9d19b6592fa',
      '67a87828-18f5-46a1-b6cc-c72a97a77c43',
      'c94ac88f-4671-3976-b60a-09064f1811e8',
      'c6d0c728-2624-429b-8e0d-d9d19b6592fa',
      '67a87828-18f5-46a1-b6cc-c72a97a77c43',
    ];
    final address = MixAddress(members: members, threshold: 4).toAddress();
    expect(
      'MIX4fwusRK88p5GexHWddUQuYJbKMJTAuBvhudgahRXKndvaM8FdPHS2Hgeo7DQxNVoSkKSEDyZeD8TYBhiwiea9PvCzay1A9Vx1C2nugc4iAmhwLGGv4h3GnABeCXHTwWEto9wEe1MWB49jLzy3nuoM81tqE2XnLvUWv',
      address,
    );
    final ma = MixAddress.parse(
      'MIX4fwusRK88p5GexHWddUQuYJbKMJTAuBvhudgahRXKndvaM8FdPHS2Hgeo7DQxNVoSkKSEDyZeD8TYBhiwiea9PvCzay1A9Vx1C2nugc4iAmhwLGGv4h3GnABeCXHTwWEto9wEe1MWB49jLzy3nuoM81tqE2XnLvUWv',
    );
    expect(ma, isNotNull);
    expect(ma.members.join(','), members.join(','));
    expect(ma.threshold, 4);
  });

  test('test 3', () {
    final members = [
      'XIN3BMNy9pQyj5XWDJtTbaBVE2zQ66zBo2weyc43iL286asdqwApWswAzQC5qba26fh3fzHK9iMoxyx1q3Lgj45KJftzGD9q'
    ];
    final address = MixAddress(members: members, threshold: 1).toAddress();
    expect(
        'MIXPYWwhjxKsbFRzAP2Dcb2mMjj7sQQo4MpCSv3NYaYCdQ2kEcbcimpPT81gaxtuNhunLWPx7Sv7fawjZ8DhRmEj8E2hrQM4Z6e',
        address);
    final ma = MixAddress.parse(
        'MIXPYWwhjxKsbFRzAP2Dcb2mMjj7sQQo4MpCSv3NYaYCdQ2kEcbcimpPT81gaxtuNhunLWPx7Sv7fawjZ8DhRmEj8E2hrQM4Z6e');
    expect(ma, isNotNull);
    expect(ma.members.join(','), members.join(','));
    expect(ma.threshold, 1);
  });

  test('test 4', () {
    final members = [
      'XINGNzunRUMmKGqDhnf1MT8tR7ek6ozg2V6dXFHCCg3tndnSRcAdzET8Fw4ktcQKshzteDmyV2RE8aFiKPz8ewrvsj3s7fvC',
      'XINMd9kCbxEoEetZuDM8gGJS11X3TVrRLwzhnqgMr65qjJBkCncNqSAngESpC7Hddnsw1D9Jo2QJakbFPr8WyrM6VkskGkB8',
      'XINLM7VuMYSjvKiEQPyLpaG7NDLDPngWWFBZpVJjhGamMsgPbmeSsGs3fQzNoqSr6syBTyLM3i69T7iSN8Tru7aQadiKLkSV',
    ];
    final address = MixAddress(members: members, threshold: 2).toAddress();
    expect(
      'MIXBCirWksVv9nuphqbtNRZZvwKsXHHMUnB5hVrVY1P7f4eBdLpDoLwiQoHYPvXia2wFepnX6hJwTjHybzBiroWVEMaFHeRFfLpcU244tzRM8smak9iRAD4PJRHN1MLHRWFtErottp9t7piaRVZBzsQXpSsaSgagj93voQdUuXhuQGZNj3Fme5YYMHfJBWjoRFHis4mnhBgxkyEGRUHAVYnfej2FhrypJmMDu74irRTdj2xjQYr6ovBJSUBYDBcvAyLPE3cEKc4JsPz7b9',
      address,
    );
    final ma = MixAddress.parse(
      'MIXBCirWksVv9nuphqbtNRZZvwKsXHHMUnB5hVrVY1P7f4eBdLpDoLwiQoHYPvXia2wFepnX6hJwTjHybzBiroWVEMaFHeRFfLpcU244tzRM8smak9iRAD4PJRHN1MLHRWFtErottp9t7piaRVZBzsQXpSsaSgagj93voQdUuXhuQGZNj3Fme5YYMHfJBWjoRFHis4mnhBgxkyEGRUHAVYnfej2FhrypJmMDu74irRTdj2xjQYr6ovBJSUBYDBcvAyLPE3cEKc4JsPz7b9',
    );
    expect(ma, isNotNull);
    expect(ma.members.join(','), members.join(','));
    expect(ma.threshold, 2);
  });
}
