import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inscription_collection.g.dart';

@JsonSerializable()
class InscriptionCollection with EquatableMixin {
  InscriptionCollection({
    required this.collectionHash,
    required this.supply,
    required this.unit,
    required this.symbol,
    required this.name,
    required this.iconUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory InscriptionCollection.fromJson(Map<String, dynamic> json) =>
      _$InscriptionCollectionFromJson(json);

  @JsonKey(name: 'collection_hash')
  final String collectionHash;
  @JsonKey(name: 'supply')
  final String supply;
  @JsonKey(name: 'unit')
  final String unit;
  @JsonKey(name: 'symbol')
  final String symbol;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'icon_url')
  final String iconUrl;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => _$InscriptionCollectionToJson(this);

  @override
  List<Object?> get props => [
        collectionHash,
        supply,
        unit,
        symbol,
        name,
        iconUrl,
        createdAt,
        updatedAt,
      ];
}
