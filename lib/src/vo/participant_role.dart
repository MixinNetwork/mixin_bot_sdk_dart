import '../enum_converter.dart';

enum ParticipantRole {
  owner,
  admin,
}

class ParticipantRoleJsonConverter extends EnumJsonConverter<ParticipantRole> {
  const ParticipantRoleJsonConverter();
  @override
  List<ParticipantRole> enumValues() => ParticipantRole.values;
}
