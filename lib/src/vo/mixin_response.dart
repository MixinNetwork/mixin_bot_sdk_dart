import 'package:dio/src/response.dart';
import 'package:equatable/equatable.dart';
import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';

import 'account.dart';
import 'app.dart';
import 'circle_conversation.dart';
import 'circle_response.dart';
import 'conversation_response.dart';
import 'provisioning.dart';
import 'sticker.dart';
import 'sticker_albums.dart';
import 'user.dart';

class MixinResponse<T> with EquatableMixin {
  T data;

  MixinResponse(
    this.data,
  );

  factory MixinResponse.fromJson(Map<String, dynamic> json) {
    var dataJson = json['data'];
    var data = dataJson == null ? null : generateJson<T>(dataJson);
    return MixinResponse<T>(data);
  }

  static Future<MixinResponse<T>> request<T>(Future<Response> future) async {
    var response = (await future).data;
    return MixinResponse<T>.fromJson(response);
  }

  @override
  List<Object?> get props => [
        data,
      ];
}

dynamic generateJson<T>(json) {
  var type = T.toString();
  if (T is List || type.startsWith('List')) {
    var itemType = type.substring(5, type.length - 1);
    var tempList = _getListFromType(itemType);

    if (tempList == null) return _generateJsonForType(type, json);

    json.forEach((itemJson) {
      tempList.add(_generateJsonForType(itemType, itemJson));
    });
    return tempList as T;
  } else {
    return _generateJsonForType(type, json);
  }
}

dynamic _generateJsonForType(type, json) {
  switch (type) {
    case 'ConversationResponse':
      return ConversationResponse.fromJson(json);
    case 'User':
      return User.fromJson(json);
    case 'App':
      return App.fromJson(json);
    case 'Provisioning':
      return Provisioning.fromJson(json);
    case 'Account':
      return Account.fromJson(json);
    case 'Attachment':
      return Attachment.fromJson(json);
    case 'StickerAlbum':
      return StickerAlbum.fromJson(json);
    case 'Sticker':
      return Sticker.fromJson(json);
    case 'CircleResponse':
      return CircleResponse.fromJson(json);
    case 'CircleConversation':
      return CircleConversation.fromJson(json);
  }
  throw Exception('Unknown type $type');
}

List? _getListFromType(String type) {
  switch (type) {
    case 'User':
      return <User>[];
    case 'App':
      return <App>[];
    case 'StickerAlbum':
      return <StickerAlbum>[];
    case 'Sticker':
      return <Sticker>[];
    case 'CircleResponse':
      return <CircleResponse>[];
    case 'CircleConversation':
      return <CircleConversation>[];
  }
  throw Exception('Unknown type $type');
}
