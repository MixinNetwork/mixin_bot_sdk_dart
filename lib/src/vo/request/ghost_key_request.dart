import 'package:json_annotation/json_annotation.dart';

part 'ghost_key_request.g.dart';

@JsonSerializable()
class GhostKeyRequest {
  GhostKeyRequest({
    required this.receivers,
    required this.index,
    required this.hint,
  });

  factory GhostKeyRequest.fromJson(Map<String, dynamic> json) =>
      _$GhostKeyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GhostKeyRequestToJson(this);

  @JsonKey(name: 'receivers')
  final List<String> receivers;
  @JsonKey(name: 'index')
  final int index;
  @JsonKey(name: 'hint')
  final String hint;
}
