import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../enum_converter.dart';

part 'relationship_request.g.dart';

@JsonSerializable()
@RelationshipActionJsonConverter()
class RelationshipRequest with EquatableMixin {
  RelationshipRequest({
    required this.userId,
    required this.action,
    this.fullName,
  });

  factory RelationshipRequest.fromJson(Map<String, dynamic> json) =>
      _$RelationshipRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RelationshipRequestToJson(this);

  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'action')
  final RelationshipAction? action;
  @JsonKey(name: 'full_name')
  final String? fullName;

  @override
  List<Object?> get props => [
        userId,
        action,
        fullName,
      ];
}

class RelationshipActionJsonConverter
    extends EnumJsonConverter<RelationshipAction> {
  const RelationshipActionJsonConverter();

  @override
  List<RelationshipAction> enumValues() => RelationshipAction.values;
}

enum RelationshipAction { add, update, remove, block, unblock }
