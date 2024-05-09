import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inscription_item.g.dart';

@JsonSerializable()
class InscriptionItem with EquatableMixin {
  InscriptionItem({
    required this.inscriptionHash,
    required this.collectionHash,
    required this.sequence,
    required this.contentType,
    required this.contentURL,
    required this.occupiedBy,
    required this.occupiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory InscriptionItem.fromJson(Map<String, dynamic> json) =>
      _$InscriptionItemFromJson(json);

  @JsonKey(name: 'inscription_hash')
  final String inscriptionHash;
  @JsonKey(name: 'collection_hash')
  final String collectionHash;
  @JsonKey(name: 'sequence')
  final int sequence;
  @JsonKey(name: 'content_type')
  final String contentType;
  @JsonKey(name: 'content_url')
  final String contentURL;
  @JsonKey(name: 'occupied_by')
  final String? occupiedBy;
  @JsonKey(name: 'occupied_at')
  final String? occupiedAt;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => _$InscriptionItemToJson(this);

  @override
  List<Object?> get props => [
        inscriptionHash,
        collectionHash,
        sequence,
        contentType,
        contentURL,
        occupiedBy,
        occupiedAt,
        createdAt,
        updatedAt,
      ];
}
