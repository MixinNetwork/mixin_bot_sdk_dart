import 'package:json_annotation/json_annotation.dart';

part 'live_message.g.dart';

@JsonSerializable()
class LiveMessage {
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
