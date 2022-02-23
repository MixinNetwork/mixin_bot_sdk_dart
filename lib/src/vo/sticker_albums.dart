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
  String albumId;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'icon_url')
  String iconUrl;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  @JsonKey(name: 'update_at')
  DateTime updateAt;
  @JsonKey(name: 'user_id')
  String userId;
  @JsonKey(name: 'category')
  String category;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'banner')
  String? banner;
  @JsonKey(name: 'is_verified', defaultValue: false)
  bool isVerified;

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
