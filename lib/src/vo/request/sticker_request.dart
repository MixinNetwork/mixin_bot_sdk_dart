import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sticker_request.g.dart';

@JsonSerializable()
class StickerRequest with EquatableMixin {
  StickerRequest({
    this.dataBase64,
    this.stickerId,
  });

  factory StickerRequest.fromJson(Map<String, dynamic> json) =>
      _$StickerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$StickerRequestToJson(this);

  @JsonKey(name: 'data_base64')
  String? dataBase64;
  @JsonKey(name: 'sticker_id')
  String? stickerId;

  @override
  List<Object?> get props => [stickerId, dataBase64];
}
