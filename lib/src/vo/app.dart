import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app.g.dart';

@JsonSerializable()
class App with EquatableMixin {
  App({
    required this.appId,
    required this.appNumber,
    required this.homeUri,
    required this.redirectUri,
    required this.name,
    required this.iconUrl,
    required this.category,
    required this.description,
    required this.appSecret,
    required this.creatorId,
    this.capabilites,
    this.resourcePatterns,
    this.updatedAt,
  });

  factory App.fromJson(Map<String, dynamic> json) => _$AppFromJson(json);

  Map<String, dynamic> toJson() => _$AppToJson(this);

  @JsonKey(name: 'app_id')
  final String appId;
  @JsonKey(name: 'app_number')
  final String appNumber;
  @JsonKey(name: 'home_uri')
  final String homeUri;
  @JsonKey(name: 'redirect_uri')
  final String redirectUri;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'icon_url')
  final String iconUrl;
  @JsonKey(name: 'category')
  final String category;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'capabilites')
  final List<String>? capabilites;
  @JsonKey(name: 'app_secret')
  final String appSecret;
  @JsonKey(name: 'creator_id')
  final String creatorId;
  @JsonKey(name: 'resource_patterns')
  final List<String>? resourcePatterns;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

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
