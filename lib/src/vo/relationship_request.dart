import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'relationship_request.g.dart';

@JsonSerializable()
class RelationshipRequest with EquatableMixin {
  @JsonKey(name: 'user_id', disallowNullValue: true)
  String userId;
  @JsonKey(name: 'action', disallowNullValue: true)
  RelationshipAction action;
  @JsonKey(name: 'full_name', disallowNullValue: false)
  String? fullName;

  RelationshipRequest({
    required this.userId,
    required this.action,
    this.fullName,
  });

  factory RelationshipRequest.fromJson(Map<String, dynamic> json) =>
      _$RelationshipRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RelationshipRequestToJson(this);

  @override
  List<Object?> get props => [
        userId,
        action,
        fullName,
      ];
}

enum RelationshipAction { add, remove, block, unblock }
