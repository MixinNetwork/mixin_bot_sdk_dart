import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mixin_error.g.dart';

@JsonSerializable()
class MixinError with EquatableMixin {
  MixinError(
    this.status,
    this.code,
    this.description,
  );

  factory MixinError.fromJson(Map<String, dynamic> json) =>
      _$MixinErrorFromJson(json);

  Map<String, dynamic> toJson() => _$MixinErrorToJson(this);

  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'code', defaultValue: 0)
  int code;
  @JsonKey(name: 'description', defaultValue: '')
  String description;

  @override
  List<Object?> get props => [
        status,
        code,
        description,
      ];
}
