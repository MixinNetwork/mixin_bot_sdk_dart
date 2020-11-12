import 'package:json_annotation/json_annotation.dart';

part 'mixin_error.g.dart';

@JsonSerializable()
class MixinError {
  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'extra')
  String extra;

  MixinError(
    this.status,
    this.code,
    this.description,
    this.extra,
  );

  factory MixinError.fromJson(Map<String, dynamic> json) =>
      _$MixinErrorFromJson(json);

  Map<String, dynamic> toJson() => _$MixinErrorToJson(this);
}
