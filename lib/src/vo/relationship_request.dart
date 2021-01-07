import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'relationship_request.g.dart';

@JsonSerializable()
class RelationshipRequest with EquatableMixin {
  @JsonKey(name: 'user_id', nullable: false)
  String userId;
  @JsonKey(name: 'action', nullable: false)
  String action;
  @JsonKey(name: 'full_name', nullable: true)
  String fullName;

  RelationshipRequest({
    this.userId,
    this.action,
    this.fullName,
  });

  factory RelationshipRequest.fromJson(Map<String, dynamic> json) =>
      _$RelationshipRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RelationshipRequestToJson(this);

  @override
  List<Object> get props => [
        userId,
        action,
        fullName,
      ];
}
