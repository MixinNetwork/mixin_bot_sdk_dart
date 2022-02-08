import 'package:json_annotation/json_annotation.dart';

part 'favorite_app.g.dart';

@JsonSerializable()
class FavoriteApp {
  FavoriteApp(this.appId, this.userId, this.createdAt);

  factory FavoriteApp.fromJson(Map<String, dynamic> json) => _$FavoriteAppFromJson(json);

  @JsonKey(name: 'app_id')
  final String appId;

  @JsonKey(name: 'user_id')
  final String userId;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;


  Map<String, dynamic> toJson() => _$FavoriteAppToJson(this);
}
