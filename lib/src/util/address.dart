import 'dart:convert';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:uuid/uuid.dart';

import '../../mixin_bot_sdk_dart.dart';

const kMixAddressVersion = 2;

const kMainAddressPrefix = 'XIN';
const kMixAddressPrefix = 'MIX';

enum MixMemberType {
  xin,
  uuid,
}

Uint8List? getPublicFromMainnetAddress(String address) {
  try {
    if (!address.startsWith(kMainAddressPrefix)) {
      return null;
    }
    final data = base58.decode(address.substring(kMainAddressPrefix.length));
    if (data.length != 68) {
      return null;
    }
    final payload = Uint8List.sublistView(data, 0, data.length - 4);
    final msg = Uint8List.fromList([
      ...utf8.encode(kMainAddressPrefix),
      ...payload,
    ]);
    final checksum = sha3Hash(msg);
    if (!Uint8List.sublistView(checksum, 0, 4)
        .equals(Uint8List.sublistView(data, 64))) {
      return null;
    }
    return Uint8List.fromList(payload);
  } catch (_) {
    return null;
  }
}

String getMainnetAddressFromPublic(Uint8List pub) {
  final msg = Uint8List.fromList([
    ...utf8.encode(kMainAddressPrefix),
    ...pub,
  ]);
  final checksum = sha3Hash(msg);
  final data = Uint8List.fromList([
    ...pub,
    ...checksum.sublist(0, 4),
  ]);
  return '$kMainAddressPrefix${base58.encode(data)}';
}

class MixAddress {
  MixAddress._private({
    required this.members,
    required this.threshold,
    required this.memberType,
  });

  factory MixAddress.fromUuid(List<String> members, int threshold) =>
      MixAddress._private(
        members: members,
        threshold: threshold,
        memberType: MixMemberType.uuid,
      );

  factory MixAddress.fromMainNetMixAddress(
    List<String> members,
    int threshold,
  ) =>
      MixAddress._private(
        members: members,
        threshold: threshold,
        memberType: MixMemberType.xin,
      );

  static MixAddress? tryParse(String address) {
    try {
      return parse(address);
    } catch (_) {
      return null;
    }
  }

  static MixAddress parse(String address) {
    if (!address.startsWith(kMixAddressPrefix)) {
      throw Exception('invalid prefix. $address');
    }
    final data = base58.decode(address.substring(kMixAddressPrefix.length));
    if (data.length < (3 + 16 + 4)) {
      throw Exception('invalid data. $address');
    }
    final payload = Uint8List.view(data.buffer, 0, data.length - 4);
    final msg = Uint8List.fromList([
      ...utf8.encode(kMixAddressPrefix),
      ...payload,
    ]);
    final checkSum = sha3Hash(msg);

    if (!Uint8List.sublistView(checkSum, 0, 4)
        .equals(Uint8List.sublistView(data, data.length - 4))) {
      throw Exception('invalid checksum. $address');
    }

    final version = data.elementAtOrNull(0);
    final threshold = data.elementAtOrNull(1);
    final total = data.elementAtOrNull(2);

    if (version != 2) {
      throw Exception('invalid version. $version');
    }
    if (threshold == null ||
        total == null ||
        threshold == 0 ||
        threshold > total ||
        total > 64) {
      throw Exception('invalid threshold or total. $threshold, $total');
    }

    final memberData = Uint8List.sublistView(payload, 3);
    final members = <String>[];

    if (memberData.length == total * 16) {
      for (var i = 0; i < total; i++) {
        final id = Uuid.unparse(memberData, offset: i * 16);
        members.add(id);
      }
      return MixAddress.fromUuid(members, threshold);
    } else if (memberData.length == total * 64) {
      for (var i = 0; i < total; i++) {
        final pub = Uint8List.sublistView(memberData, i * 64, (i + 1) * 64);
        final address = getMainnetAddressFromPublic(pub);
        members.add(address);
      }
      return MixAddress.fromMainNetMixAddress(members, threshold);
    }

    throw Exception('invalid member data. $memberData');
  }

  final List<String> members;
  final int threshold;
  final MixMemberType memberType;

  String toAddress() {
    if (members.length > 255) {
      throw Exception('too many members. ${members.length}');
    }
    if (threshold == 0 || threshold > members.length) {
      throw Exception('invalid threshold. $threshold');
    }

    final prefix = Uint8List.fromList([
      kMixAddressVersion,
      threshold,
      members.length,
    ]);

    final memberData = <Uint8List>[];
    MixMemberType? type;
    for (final member in members) {
      if (member.startsWith(kMainAddressPrefix)) {
        if (type == null) {
          type = MixMemberType.xin;
        } else if (type != MixMemberType.xin) {
          throw Exception('invalid member type. $member');
        }
        final pub = getPublicFromMainnetAddress(member);
        if (pub == null) {
          throw Exception('invalid member address. $member');
        }
        memberData.add(pub);
      } else {
        if (type == null) {
          type = MixMemberType.uuid;
        } else if (type != MixMemberType.uuid) {
          throw Exception('invalid member type. $member');
        }
        try {
          final uuid = Uuid.parse(member);
          memberData.add(Uint8List.fromList(uuid));
        } catch (error) {
          throw Exception('invalid member uuid. $member');
        }
      }
    }

    final msg = Uint8List.fromList([
      ...utf8.encode(kMixAddressPrefix),
      ...prefix,
      ...memberData.expand((element) => element),
    ]);
    final checksum = sha3Hash(msg);
    final data = Uint8List.fromList([
      ...prefix,
      ...memberData.expand((element) => element),
      ...checksum.sublist(0, 4),
    ]);
    return '$kMixAddressPrefix${base58.encode(data)}';
  }
}
