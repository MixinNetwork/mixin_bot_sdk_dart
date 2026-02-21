import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sticker_albums.g.dart';

@JsonSerializable()
class StickerAlbum with EquatableMixin {
  StickerAlbum({
    required this.albumId,
    required this.name,
    required this.iconUrl,
    required this.createdAt,
    required this.updateAt,
    required this.userId,
    required this.category,
    required this.description,
    this.banner,
    this.isVerified = false,
  });

  factory StickerAlbum.fromJson(Map<String, dynamic> json) =>
      _$StickerAlbumFromJson(json);

  Map<String, dynamic> toJson() => _$StickerAlbumToJson(this);

  @JsonKey(name: 'album_id')
  final String albumId;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'icon_url')
  final String iconUrl;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'update_at')
  final DateTime updateAt;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'category')
  final String category;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'banner')
  final String? banner;
  @JsonKey(name: 'is_verified')
  final bool isVerified;

  @override
  List<Object?> get props => [
    albumId,
    name,
    iconUrl,
    createdAt,
    updateAt,
    userId,
    category,
    description,
    banner,
  ];
}
