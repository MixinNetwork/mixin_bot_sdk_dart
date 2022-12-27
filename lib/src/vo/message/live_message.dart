import 'package:json_annotation/json_annotation.dart';

import '../../util/json_int_converter.dart';

part 'live_message.g.dart';

@JsonSerializable()
@JsonStringToInt()
class LiveMessage {
  // ignore: avoid_positional_boolean_parameters
  LiveMessage(this.width, this.height, this.thumbUrl, this.url, this.shareable);

  factory LiveMessage.fromJson(Map<String, dynamic> json) =>
      _$LiveMessageFromJson(json);

  @JsonKey(name: 'width')
  int width;
  @JsonKey(name: 'height')
  int height;
  @JsonKey(name: 'thumb_url')
  String thumbUrl;
  @JsonKey(name: 'url')
  String url;
  @JsonKey(defaultValue: true)
  final bool shareable;

  Map<String, dynamic> toJson() => _$LiveMessageToJson(this);
}
