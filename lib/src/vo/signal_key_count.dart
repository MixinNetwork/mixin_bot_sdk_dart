import 'package:json_annotation/json_annotation.dart';

part 'signal_key_count.g.dart';

@JsonSerializable()
class SignalKeyCount {
  @JsonKey(name: 'one_time_pre_keys_count', nullable: false)
  int preKeyCount;

  SignalKeyCount({this.preKeyCount});

  factory SignalKeyCount.fromJson(Map<String, dynamic> json) =>
      _$SignalKeyCountFromJson(json);

  Map<String, dynamic> toJson() => _$SignalKeyCountToJson(this);
}
