import '../enum_converter.dart';

enum ConversationCategory { contact, group }

class ConversationCategoryJsonConverter
    extends EnumStringJsonConverter<ConversationCategory> {
  const ConversationCategoryJsonConverter();
  @override
  List<ConversationCategory> enumValues() => ConversationCategory.values;
}
