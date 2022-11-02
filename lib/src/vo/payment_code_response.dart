import 'package:json_annotation/json_annotation.dart';

import 'code_type_interface.dart';

part 'payment_code_response.g.dart';

@JsonSerializable()
class PaymentCodeResponse implements CodeTypeInterface {
  PaymentCodeResponse(
    this.codeId,
    this.assetId,
    this.amount,
    this.receivers,
    this.threshold,
    this.status,
    this.memo,
    this.traceId,
    this.createdAt,
  );

  factory PaymentCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentCodeResponseFromJson(json);

  @JsonKey(name: 'code_id')
  final String codeId;
  @JsonKey(name: 'asset_id')
  final String assetId;
  final String amount;
  final List<String> receivers;
  final int threshold;
  final String status;
  final String memo;
  @JsonKey(name: 'trace_id')
  final String traceId;
  @JsonKey(name: 'created_at')
  final String createdAt;

  Map<String, dynamic> toJson() => _$PaymentCodeResponseToJson(this);
}
