import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../mixin_bot_sdk_dart.dart';

part 'relationship_request.g.dart';

@JsonSerializable()
@RelationshipActionJsonConverter()
class RelationshipRequest with EquatableMixin {
  @JsonKey(name: 'user_id')
  String userId;
  @JsonKey(name: 'action')
  RelationshipAction? action;
  @JsonKey(name: 'full_name')
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

class RelationshipActionJsonConverter
    extends EnumJsonConverter<RelationshipAction> {
  const RelationshipActionJsonConverter();

  @override
  List<RelationshipAction> enumValues() => RelationshipAction.values;
}

enum RelationshipAction { add, update, remove, block, unblock }
