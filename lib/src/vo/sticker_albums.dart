import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sticker_albums.g.dart';

@JsonSerializable()
class StickerAlbum with EquatableMixin {
  @JsonKey(name: 'album_id', nullable: false)
  String albumId;
  @JsonKey(name: 'name', nullable: true)
  String name;
  @JsonKey(name: 'icon_url', nullable: false)
  String iconUrl;
  @JsonKey(name: 'created_at', nullable: false)
  String createdAt;
  @JsonKey(name: 'update_at', nullable: false)
  String updateAt;
  @JsonKey(name: 'user_id', nullable: false)
  String userId;
  @JsonKey(name: 'category', nullable: false)
  String category;
  @JsonKey(name: 'description', nullable: false)
  String description;

  StickerAlbum(this.albumId, this.name, this.iconUrl, this.createdAt,
      this.updateAt, this.userId, this.category, this.description);

  factory StickerAlbum.fromJson(Map<String, dynamic> json) =>
      _$StickerAlbumFromJson(json);
  Map<String, dynamic> toJson() => _$StickerAlbumToJson(this);

  @override
  List<Object> get props => [
        albumId,
        name,
        iconUrl,
        createdAt,
        updateAt,
        userId,
        category,
        description
      ];
}
