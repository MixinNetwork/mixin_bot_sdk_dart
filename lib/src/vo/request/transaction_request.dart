import 'package:json_annotation/json_annotation.dart';

part 'transaction_request.g.dart';

@JsonSerializable()
class TransactionRequest {
  TransactionRequest({
    required this.raw,
    required this.requestId,
  });

  factory TransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$TransactionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionRequestToJson(this);

  @JsonKey(name: 'raw')
  final String raw;
  @JsonKey(name: 'request_id')
  final String requestId;
}
