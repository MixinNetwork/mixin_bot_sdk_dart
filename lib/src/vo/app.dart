import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app.g.dart';

@JsonSerializable()
class App with EquatableMixin {
  @JsonKey(name: 'app_id')
  String appId;
  @JsonKey(name: 'app_number')
  String appNumber;
  @JsonKey(name: 'home_uri')
  String homeUri;
  @JsonKey(name: 'redirect_uri')
  String redirectUri;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'icon_url')
  String iconUrl;
  @JsonKey(name: 'category')
  String category;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'capabilites')
  List<String>? capabilites;
  @JsonKey(name: 'app_secret')
  String appSecret;
  @JsonKey(name: 'creator_id')
  String creatorId;
  @JsonKey(name: 'resource_patterns')
  List<String>? resourcePatterns;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  App({
    required this.appId,
    required this.appNumber,
    required this.homeUri,
    required this.redirectUri,
    required this.name,
    required this.iconUrl,
    required this.category,
    required this.description,
    this.capabilites,
    required this.appSecret,
    required this.creatorId,
    this.resourcePatterns,
    this.updatedAt,
  });

  factory App.fromJson(Map<String, dynamic> json) => _$AppFromJson(json);

  Map<String, dynamic> toJson() => _$AppToJson(this);

  @override
  List<Object?> get props => [
        appId,
        appNumber,
        homeUri,
        redirectUri,
        name,
        iconUrl,
        category,
        description,
        capabilites,
        appSecret,
        creatorId,
        resourcePatterns,
        updatedAt,
      ];
}
