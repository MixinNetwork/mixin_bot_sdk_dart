import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:test/test.dart';

void main() {
  test(
    'fromStringToEnum matches names case-insensitively, also when cached',
    () {
      for (var i = 0; i < 2; i++) {
        expect(
          fromStringToEnum(UserRelationship.values, 'STRANGER'),
          UserRelationship.stranger,
        );
        expect(
          fromStringToEnum(UserRelationship.values, 'friend'),
          UserRelationship.friend,
        );
        expect(fromStringToEnum(UserRelationship.values, 'unknown'), isNull);
        expect(fromStringToEnum(UserRelationship.values, null), isNull);
      }
    },
  );

  test('EnumJsonConverter reads constant case JSON, also when cached', () {
    const converter = ConversationCategoryJsonConverter();
    for (var i = 0; i < 2; i++) {
      expect(converter.fromJson('GROUP'), ConversationCategory.group);
      expect(converter.fromJson('CONTACT'), ConversationCategory.contact);
      expect(converter.fromJson(null), isNull);
      expect(converter.toJson(ConversationCategory.group), 'GROUP');
    }
  });
}
