// ignore_for_file: implementation_imports
import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:decimal/decimal.dart';
import 'package:pointycastle/src/utils.dart';
import 'package:uuid/uuid.dart';

import 'safe.dart';

const int _kMaximumEncodingInt = 0xffff;
const int AggregatedSignaturePrefix = 0xff01;

final Uint8List magic = Uint8List.fromList([0x77, 0x77]);
final Uint8List empty = Uint8List.fromList([0x00, 0x00]);

Uint8List putUvarInt(int x) {
  final buf = <int>[];
  var i = 0;
  while (x >= 0x80) {
    buf.add(x | 0x80);
    x >>= 7;
    i++;
  }
  buf.add(x);
  return Uint8List.fromList(buf);
}

BigInt _amountToEthUnit(String amount, {int decimals = 8}) {
  final a = Decimal.parse(amount);
  final b = Decimal.parse(a.toStringAsFixed(decimals));
  return BigInt.parse(
      (b * Decimal.fromInt(10).pow(decimals).toDecimal()).toString());
}

class Encoder {
  Encoder();

  final List<int> _buf = [];

  void write(List<int> buffer) {
    _buf.addAll(buffer);
  }

  void writeBytes(Uint8List buffer) {
    final len = buffer.length;
    writeInt(len);
    write(buffer);
  }

  void writeSlice(Uint8List buffer) {
    final l = buffer.length;
    if (l > 128) throw Exception('slice too long, length $l, maximum 128');
    write(Uint8List.fromList([l]));
    write(buffer);
  }

  void writeUtf8String(String data) {
    final buf = utf8.encode(data);
    writeInt(buf.length);
    write(buf);
  }

  void writeInt(int i) {
    if (i > _kMaximumEncodingInt) {
      throw Exception('invalid integer $i, maximum $_kMaximumEncodingInt');
    }
    final buf = Uint8List(2);
    buf.buffer.asByteData().setUint16(0, i);
    write(buf);
  }

  void writeUint16(int i) {
    final buf = Uint8List(2);
    buf.buffer.asByteData().setUint16(0, i);
    write(buf);
  }

  void writeUint32(int i) {
    final buf = Uint8List(4);
    buf.buffer.asByteData().setUint32(0, i);
    write(buf);
  }

  void writeUint64(BigInt i) {
    // TODO(BIN): improve this
    final buf = Uint8List(8);
    buf.buffer.asByteData().setUint64(0, i.toUnsigned(64).toInt());
    write(buf);
  }

  void writeBigInt(BigInt i) {
    final bytes = encodeBigInt(i);
    writeInt(bytes.length);
    write(bytes);
  }

  // TODO convert array like to array
  void writeUUID(String id) {
    final uuid = Uuid.parse(id);
    for (var i = 0; i < uuid.length; i += 1) {
      write(Uint8List.fromList([uuid[i]]));
    }
  }

  void encodeInput(Input input) {
    final i = input;
    write(hex.decode(i.hash));
    writeInt(i.index);

    writeUtf8String(i.genesis ?? '');

    final d = i.deposit;
    if (d == null) {
      write(empty);
    } else {
      // TODO(BIN): ... to test...
      write(magic);
      write(hex.decode(d.chain));

      writeUtf8String(d.asset);
      writeUtf8String(d.transaction);

      writeUint64(d.index);
      writeBigInt(BigInt.from(d.amount));
    }
    final m = i.mint;
    if (m == null) {
      write(empty);
    } else {
      write(magic);
      writeUtf8String(m.group);

      writeUint64(m.batch);
      writeBigInt(BigInt.from(m.amount));
    }
  }

  void encodeOutput(Output output) {
    final o = output;
    write([0x00, o.type?.value ?? 0]);
    writeBigInt(_amountToEthUnit(o.amount));
    writeInt(o.keys!.length);
    for (final key in o.keys!) {
      write(hex.decode(key));
    }

    write(hex.decode(o.mask ?? ''));

    final script = hex.decode(o.script ?? '');
    writeInt(script.length);
    write(script);

    final w = o.withdrawal;
    if (w == null) {
      write(empty);
    } else {
      // TODO... not check...
      write(magic);
      writeUtf8String(w.address);
      writeUtf8String(w.tag);
    }
  }

  // void encodeAggregatedSignature(Map<String, dynamic> js) {
  //   writeInt(MaximumEncodingInt);
  //   writeInt(AggregatedSignaturePrefix);
  //   write(Uint8List.fromList(List<int>.from(js['signature'], growable: false)));
  //
  //   if ((js['signers'] as List).isEmpty) {
  //     write(Uint8List.fromList([0x00]));
  //     writeInt(0);
  //     return;
  //   }
  //
  //   (js['signers'] as List).forEach((m, i) {
  //     if (i > 0 && m <= (js['signers'] as List)[i - 1]) {
  //       throw Exception('signers not sorted');
  //     }
  //     if (m > MaximumEncodingInt) {
  //       throw Exception('signer overflow');
  //     }
  //   });
  //
  //   final max = (js['signers'] as List)[(js['signers'] as List).length - 1];
  //
  //   if ((((max ~/ 8) + 1) ~/ 1) > (js['signature'] as List).length * 2) {
  //     // TODO... not check...
  //     write(Uint8List.fromList([0x01]));
  //     writeInt((js['signature'] as List).length);
  //     (js['signers'] as List).forEach((m) => writeInt(m as int));
  //     return;
  //   }
  //
  //   final masks = Uint8List((((max ~/ 8) + 1) ~/ 1).toInt());
  //   (js['signers'] as List).forEach((m) {
  //     masks[(m ~/ 8).toInt()] ^= 1 << (m % 8).toInt();
  //   });
  //   write(Uint8List.fromList([0x00]));
  //   writeInt(masks.length);
  //   write(masks);
  // }

  void encodeSignature(Map<int, String> sm) {
    final ss = sm.entries.toList()..sort((a, b) => a.key.compareTo(b.key));
    writeInt(ss.length);
    ss.forEach((s) {
      writeUint16(s.key);
      write(utf8.encode(s.value));
    });
  }

  String toHex() => hex.encode(_buf);
}
