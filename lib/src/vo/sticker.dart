import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sticker.g.dart';

@JsonSerializable()
class Sticker with EquatableMixin {
  @JsonKey(name: 'sticker_id', nullable: false)
  String stickerId;
  @JsonKey(name: 'album_id')
  String albumId;
  @JsonKey(name: 'name', nullable: true)
  String name;
  @JsonKey(name: 'asset_url', nullable: false)
  String assetUrl;
  @JsonKey(name: 'asset_type', nullable: false)
  String assetType;
  @JsonKey(name: 'asset_width', nullable: false)
  int assetWidth;
  @JsonKey(name: 'asset_height', nullable: false)
  int assetHeight;
  @JsonKey(name: 'created_at', nullable: false)
  String createdAt;

  Sticker(this.stickerId, this.albumId, this.name, this.assetUrl,
      this.assetType, this.assetWidth, this.assetHeight, this.createdAt);

  factory Sticker.fromJson(Map<String, dynamic> json) =>
      _$StickerFromJson(json);

  Map<String, dynamic> toJson() => _$StickerToJson(this);

  @override
  List<Object> get props => [
        stickerId,
        albumId,
        name,
        assetUrl,
        assetType,
        assetWidth,
        assetHeight,
        createdAt
      ];
}
