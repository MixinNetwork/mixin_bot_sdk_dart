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

  String? dataBase64;
  String? stickerId;

  @override
  List<Object?> get props => [stickerId, dataBase64];
}
