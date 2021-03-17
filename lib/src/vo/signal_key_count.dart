import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signal_key_count.g.dart';

@JsonSerializable()
class SignalKeyCount with EquatableMixin {
  @JsonKey(name: 'one_time_pre_keys_count')
  int preKeyCount;

  SignalKeyCount({required this.preKeyCount});

  factory SignalKeyCount.fromJson(Map<String, dynamic> json) =>
      _$SignalKeyCountFromJson(json);

  Map<String, dynamic> toJson() => _$SignalKeyCountToJson(this);

  @override
  List<Object> get props => [preKeyCount];
}
