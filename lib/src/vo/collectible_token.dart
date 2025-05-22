import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'collectible_token_meta.dart';

part 'collectible_token.g.dart';

@JsonSerializable()
class CollectibleToken with EquatableMixin {
  CollectibleToken(
    this.type,
    this.tokenId,
    this.group,
    this.token,
    this.mixinId,
    this.nfo,
    this.meta,
    this.createdAt,
    this.receivers,
    this.receiversThreshold,
    this.collectionId,
  );

  factory CollectibleToken.fromJson(Map<String, dynamic> json) =>
      _$CollectibleTokenFromJson(json);

  Map<String, dynamic> toJson() => _$CollectibleTokenToJson(this);

  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'token_id')
  final String tokenId;
  @JsonKey(name: 'group')
  final String group;
  @JsonKey(name: 'token')
  final String token;
  @JsonKey(name: 'mixin_id')
  final String mixinId;

  @JsonKey(name: 'collection_id')
  final String collectionId;

  @JsonKey(name: 'nfo')
  final String nfo;
  @JsonKey(name: 'meta')
  final CollectibleTokenMeta meta;
  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'receivers')
  final List<String>? receivers;

  @JsonKey(name: 'receivers_threshold')
  final int receiversThreshold;

  @override
  List<Object?> get props => [
        type,
        tokenId,
        group,
        token,
        mixinId,
        nfo,
        meta,
        createdAt,
        receivers,
        receiversThreshold,
        collectionId,
      ];
}
