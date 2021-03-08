import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sticker_albums.g.dart';

@JsonSerializable()
class StickerAlbum with EquatableMixin {
  @JsonKey(name: 'album_id', disallowNullValue: true)
  String albumId;
  @JsonKey(name: 'name', disallowNullValue: false)
  String name;
  @JsonKey(name: 'icon_url', disallowNullValue: true)
  String iconUrl;
  @JsonKey(name: 'created_at', disallowNullValue: true)
  DateTime createdAt;
  @JsonKey(name: 'update_at', disallowNullValue: true)
  DateTime updateAt;
  @JsonKey(name: 'user_id', disallowNullValue: true)
  String userId;
  @JsonKey(name: 'category', disallowNullValue: true)
  String category;
  @JsonKey(name: 'description', disallowNullValue: true)
  String description;

  StickerAlbum({
    required this.albumId,
    required this.name,
    required this.iconUrl,
    required this.createdAt,
    required this.updateAt,
    required this.userId,
    required this.category,
    required this.description,
  });

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
