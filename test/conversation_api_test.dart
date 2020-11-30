import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:mixin_bot_sdk_dart/src/vo/conversation.dart';
import 'package:mixin_bot_sdk_dart/src/vo/conversation_response.dart';
import 'package:test/test.dart';

import 'config.dart';

void main() {
  group('test conversation apis', () {
    var client = Client('UA', uid, sid, private);

    test('test createConversation', () async {
      await client.conversationdApi
          .createConversation(createConversationRequest)
          .then((response) {
        response.handleResponse(
            onSuccess: (Conversation conversation) {
              print(conversation.toString());
            },
            onFailure: (MixinError error) => {print(error.toJson())});
      });
    });

    test('test getConversation', () async {
      await client.conversationdApi.getConversation(cid).then((response) {
        response.handleResponse(
            onSuccess: (ConversationResponse conversationResponse) {
              print(conversationResponse.toJson());
            },
            onFailure: (MixinError error) => {print(error.toJson())});
      });
    });

    test('test updateConversation', () async {
      await client.conversationdApi.updateConversation(cid).then((response) {
        response.handleResponse(
            onSuccess: (ConversationResponse conversationResponse) {
              print(conversationResponse.toJson());
            },
            onFailure: (MixinError error) => {print(error.toJson())});
      });
    });
  });
}
