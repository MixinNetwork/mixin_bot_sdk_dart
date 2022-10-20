import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'log_response.g.dart';

@JsonSerializable()
class LogResponse with EquatableMixin {
  LogResponse({
    required this.type,
    required this.logId,
    required this.code,
    required this.ipAddress,
    required this.createdAt,
  });

  factory LogResponse.fromJson(Map<String, dynamic> json) => _$LogResponseFromJson(json);

  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'log_id')
  final String logId;

  @JsonKey(name: 'code')
  final String code;

  @JsonKey(name: 'ip_address')
  final String ipAddress;

  @JsonKey(name: 'created_at')
  final String createdAt;

  Map<String, dynamic> toJson() => _$LogResponseToJson(this);

  @override
  List<Object?> get props => [
    type,
    logId,
    code,
    ipAddress,
    createdAt,
  ];
}
