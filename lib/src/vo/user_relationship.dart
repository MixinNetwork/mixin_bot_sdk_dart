import '../enum_converter.dart';

enum UserRelationship {
  friend,
  me,
  stranger,
  blocking,
}

class UserRelationshipJsonConverter
    extends EnumStringJsonConverter<UserRelationship> {
  const UserRelationshipJsonConverter();
  @override
  List<UserRelationship> enumValues() => UserRelationship.values;
}
