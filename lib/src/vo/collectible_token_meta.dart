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
  final String group;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'icon_url')
  final String iconUrl;
  @JsonKey(name: 'media_url')
  final String mediaUrl;
  @JsonKey(name: 'mime')
  final String mime;
  @JsonKey(name: 'hash')
  final String hash;

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
