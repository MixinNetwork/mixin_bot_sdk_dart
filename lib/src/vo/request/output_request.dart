import 'package:json_annotation/json_annotation.dart';

part 'output_request.g.dart';

@JsonSerializable()
class OutputRequest {
  OutputRequest({
    required this.receivers,
    required this.index,
    this.hint,
  });

  factory OutputRequest.fromJson(Map<String, dynamic> json) =>
      _$OutputRequestFromJson(json);

  final List<String> receivers;
  final int index;
  final String? hint;

  Map<String, dynamic> toJson() => _$OutputRequestToJson(this);

}
