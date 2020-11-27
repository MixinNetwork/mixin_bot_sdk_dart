import 'package:json_annotation/json_annotation.dart';

part 'participant_request.g.dart';

@JsonSerializable()
class ParticipantRequest {
  @JsonKey(name: 'user_id', nullable: false)
  String userId;
  @JsonKey(name: 'role', nullable: false)
  String role;
  @JsonKey(name: 'created_at', nullable: true)
  String createdAt;

  ParticipantRequest({this.userId, this.role, this.createdAt});

  factory ParticipantRequest.fromJson(Map<String, dynamic> json) =>
      _$ParticipantRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipantRequestToJson(this);
}

enum RelationshipAction { add, update, remove, block, unblock }
