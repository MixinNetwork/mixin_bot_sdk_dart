import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collectible_token_meta.g.dart';

@JsonSerializable()
class CollectibleTokenMeta with EquatableMixin {
  CollectibleTokenMeta(
    this.group,
    this.name,
    this.description,
    this.iconUrl,
    this.mediaUrl,
    this.mime,
    this.hash,
  );

  factory CollectibleTokenMeta.fromJson(Map<String, dynamic> json) =>
      _$CollectibleTokenMetaFromJson(json);

  @JsonKey(name: 'group')
  String group;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'icon_url')
  String iconUrl;
  @JsonKey(name: 'media_url')
  String mediaUrl;
  @JsonKey(name: 'mime')
  String mime;
  @JsonKey(name: 'hash')
  String hash;

  @override
  List<Object> get props => [
        group,
        name,
        description,
        iconUrl,
        mediaUrl,
        mime,
        hash,
      ];

  Map<String, dynamic> toJson() => _$CollectibleTokenMetaToJson(this);
}
