import 'package:bot_api_dart_client/bot_api_dart_client.dart';
import 'package:bot_api_dart_client/src/vo/conversation.dart';
import 'package:bot_api_dart_client/src/vo/conversation_response.dart';
import 'package:test/test.dart';

import 'config.dart';

void main() {
  group('test conversation apis', () {
    var client = Client('UA', uid, sid, private);

    test('test createConversation', () async {
      await client.conversationdApi.createConversation(createConversationRequest).then((response) {
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