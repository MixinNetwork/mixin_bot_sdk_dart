import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sticker.g.dart';

@JsonSerializable()
class Sticker with EquatableMixin {
  @JsonKey(name: 'sticker_id', disallowNullValue: true)
  String stickerId;
  @JsonKey(name: 'album_id')
  String? albumId;
  @JsonKey(name: 'name', disallowNullValue: false)
  String name;
  @JsonKey(name: 'asset_url', disallowNullValue: true)
  String assetUrl;
  @JsonKey(name: 'asset_type', disallowNullValue: true)
  String assetType;
  @JsonKey(name: 'asset_width', disallowNullValue: true)
  int assetWidth;
  @JsonKey(name: 'asset_height', disallowNullValue: true)
  int assetHeight;
  @JsonKey(name: 'created_at', disallowNullValue: true)
  DateTime createdAt;
  @JsonKey(name: 'last_use_at')
  DateTime? lastUsedAt;

  Sticker({
    required this.stickerId,
    this.albumId,
    required this.name,
    required this.assetUrl,
    required this.assetType,
    required this.assetWidth,
    required this.assetHeight,
    required this.createdAt,
    this.lastUsedAt,
  });

  factory Sticker.fromJson(Map<String, dynamic> json) =>
      _$StickerFromJson(json);

  Map<String, dynamic> toJson() => _$StickerToJson(this);

  @override
  List<Object?> get props => [
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
