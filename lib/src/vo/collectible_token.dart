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
  String type;
  @JsonKey(name: 'token_id')
  String tokenId;
  @JsonKey(name: 'group')
  String group;
  @JsonKey(name: 'token')
  String token;
  @JsonKey(name: 'mixin_id')
  String mixinId;

  @JsonKey(name: 'collection_id')
  String collectionId;

  @JsonKey(name: 'nfo')
  String nfo;
  @JsonKey(name: 'meta')
  CollectibleTokenMeta meta;
  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'receivers')
  List<String>? receivers;

  @JsonKey(name: 'receivers_threshold')
  int receiversThreshold;

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
