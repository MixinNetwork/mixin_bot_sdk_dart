import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../mixin_bot_sdk_dart.dart';

part 'transaction_response.g.dart';

@JsonSerializable()
class TransactionResponse with EquatableMixin {
  TransactionResponse({
    required this.type,
    required this.requestId,
    required this.userId,
    required this.amount,
    required this.transactionHash,
    required this.snapshotId,
    required this.asset,
    required this.sendersHash,
    required this.sendersThreshold,
    required this.senders,
    required this.signers,
    required this.extra,
    required this.state,
    required this.rawTransaction,
    required this.createdAt,
    required this.updatedAt,
    required this.snapshotHash,
    required this.snapshotAt,
    required this.views,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionResponseToJson(this);

  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'request_id')
  final String requestId;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'amount')
  final String amount;
  @JsonKey(name: 'transaction_hash')
  final String transactionHash;
  @JsonKey(name: 'snapshot_id')
  final String? snapshotId;
  @JsonKey(name: 'asset')
  final String asset;
  @JsonKey(name: 'senders_hash')
  final String sendersHash;
  @JsonKey(name: 'senders_threshold')
  final int sendersThreshold;
  @JsonKey(name: 'senders')
  final List<String> senders;
  @JsonKey(name: 'signers')
  final List<String> signers;
  @JsonKey(name: 'extra')
  final String extra;
  @JsonKey(name: 'state')
  final String state;
  @JsonKey(name: 'raw_transaction')
  final String rawTransaction;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'snapshot_hash')
  final String snapshotHash;
  @JsonKey(name: 'snapshot_at')
  final String snapshotAt;
  @JsonKey(name: 'views')
  final List<String>? views;

  String getSnapshotId() {
    if (snapshotId == null || snapshotId!.isEmpty) {
      return nameUuidFromBytes(utf8.encode('$userId:$transactionHash')).uuid;
    }
    return snapshotId!;
  }

  @override
  List<Object?> get props => [
    type,
    requestId,
    userId,
    amount,
    transactionHash,
    snapshotId,
    asset,
    sendersHash,
    sendersThreshold,
    senders,
    signers,
    extra,
    state,
    rawTransaction,
    createdAt,
    updatedAt,
    snapshotHash,
    snapshotAt,
    views,
  ];
}
