import 'package:json_annotation/json_annotation.dart';

part 'collectible_collection.g.dart';

@JsonSerializable()
class CollectibleCollection {
  CollectibleCollection({
    required this.type,
    required this.collectionId,
    required this.name,
    required this.description,
    required this.iconUrl,
    required this.createdAt,
  });

  factory CollectibleCollection.fromJson(Map<String, dynamic> json) =>
      _$CollectibleCollectionFromJson(json);

  final String type;

  @JsonKey(name: 'collection_id')
  final String collectionId;
  final String name;
  final String description;

  @JsonKey(name: 'icon_url')
  final String iconUrl;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  Map<String, dynamic> toJson() => _$CollectibleCollectionToJson(this);
}
