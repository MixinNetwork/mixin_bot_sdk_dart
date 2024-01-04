import 'package:json_annotation/json_annotation.dart';

part 'ghost_key.g.dart';

@JsonSerializable()
class GhostKey {
  GhostKey(this.type, this.mask, this.keys);

  factory GhostKey.fromJson(Map<String, dynamic> json) =>
      _$GhostKeyFromJson(json);

  final String type;
  final String mask;
  final List<String> keys;

  Map<String, dynamic> toJson() => _$GhostKeyToJson(this);
}

@JsonSerializable()
class SafeGhostKey {
  SafeGhostKey({
    required this.mask,
    required this.keys,
  });

  factory SafeGhostKey.fromJson(Map<String, dynamic> json) =>
      _$SafeGhostKeyFromJson(json);

  /// kernel mask key
  @JsonKey(name: 'mask')
  final String mask;

  /// ghost public keys
  @JsonKey(name: 'keys')
  final List<String> keys;

  Map<String, dynamic> toJson() => _$SafeGhostKeyToJson(this);
}
