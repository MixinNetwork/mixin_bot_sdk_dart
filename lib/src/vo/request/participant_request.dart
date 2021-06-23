import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import '../participant_role.dart';

part 'participant_request.g.dart';

@JsonSerializable()
@ParticipantRoleJsonConverter()
class ParticipantRequest with EquatableMixin {
  ParticipantRequest({
    required this.userId,
    this.role,
    this.createdAt,
  });

  factory ParticipantRequest.fromJson(Map<String, dynamic> json) =>
      _$ParticipantRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipantRequestToJson(this);

  @JsonKey(name: 'user_id')
  String userId;
  @JsonKey(name: 'role')
  ParticipantRole? role;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  @override
  List<Object?> get props => [
        userId,
        role,
        createdAt,
      ];
}

const kRelationshipActionAdd = 'ADD';
const kRelationshipActionUpdate = 'UPDATE';
const kRelationshipActionRemove = 'REMOVE';
const kRelationshipActionBlock = 'BLOCK';
const kRelationshipActionUnblock = 'UNBLOCK';
