import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logout_request.g.dart';

@JsonSerializable()
class LogoutRequest with EquatableMixin {
  @JsonKey(name: 'session_id')
  String sessionId;

  LogoutRequest(this.sessionId);

  factory LogoutRequest.fromJson(Map<String, dynamic> json) =>
      _$LogoutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutRequestToJson(this);

  @override
  List<Object?> get props => [sessionId];
}
