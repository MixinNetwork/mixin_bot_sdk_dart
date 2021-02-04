import '../enum_converter.dart';

enum ParticipantRole {
  owner,
  admin,
}

class ParticipantRoleJsonConverter
    extends EnumStringJsonConverter<ParticipantRole> {
  const ParticipantRoleJsonConverter();
  @override
  List<ParticipantRole> enumValues() => ParticipantRole.values;
}
