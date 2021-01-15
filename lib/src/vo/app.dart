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
  @JsonKey(name: 'capabilities')
  List<String> capabilities;
  @JsonKey(name: 'app_secret')
  String appSecret;
  @JsonKey(name: 'creator_id')
  String creatorId;
  @JsonKey(name: 'resource_patterns')
  List<String> resourcePatterns;
  @JsonKey(name: 'updated_at')
  DateTime updatedAt;

  App({
    this.appId,
    this.appNumber,
    this.homeUri,
    this.redirectUri,
    this.name,
    this.iconUrl,
    this.category,
    this.description,
    this.capabilities,
    this.appSecret,
    this.creatorId,
    this.resourcePatterns,
    this.updatedAt,
  });

  factory App.fromJson(Map<String, dynamic> json) => _$AppFromJson(json);

  Map<String, dynamic> toJson() => _$AppToJson(this);

  @override
  List<Object> get props => [
    appId,
    appNumber,
    homeUri,
    redirectUri,
    name,
    iconUrl,
    category,
    description,
    capabilities,
    appSecret,
    creatorId,
    resourcePatterns,
    updatedAt,
  ];
}
