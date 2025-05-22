import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sticker.g.dart';

@JsonSerializable()
class Sticker with EquatableMixin {
  Sticker({
    required this.stickerId,
    required this.name,
    required this.assetUrl,
    required this.assetType,
    required this.assetWidth,
    required this.assetHeight,
    required this.createdAt,
    this.albumId,
    this.lastUsedAt,
  });

  factory Sticker.fromJson(Map<String, dynamic> json) =>
      _$StickerFromJson(json);

  Map<String, dynamic> toJson() => _$StickerToJson(this);

  @JsonKey(name: 'sticker_id')
  final String stickerId;
  @JsonKey(name: 'album_id')
  final String? albumId;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'asset_url')
  final String assetUrl;
  @JsonKey(name: 'asset_type')
  final String assetType;
  @JsonKey(name: 'asset_width')
  final int assetWidth;
  @JsonKey(name: 'asset_height')
  final int assetHeight;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'last_use_at')
  final DateTime? lastUsedAt;

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
