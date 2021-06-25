import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../mixin_bot_sdk_dart.dart';
import 'account.dart';
import 'address.dart';
import 'app.dart';
import 'asset.dart';
import 'circle_conversation.dart';
import 'circle_response.dart';
import 'conversation_response.dart';
import 'fiat.dart';
import 'payment_response.dart';
import 'pending_deposit.dart';
import 'provisioning.dart';
import 'signal_key_count.dart';
import 'snapshot.dart';
import 'sticker.dart';
import 'sticker_albums.dart';
import 'ticker.dart';
import 'user.dart';

class MixinResponse<T> with EquatableMixin {
  MixinResponse(
    this.data,
  );

  factory MixinResponse.fromJson(Map<String, dynamic> json) {
    final dataJson = json['data'];
    final data = dataJson == null ? null : generateJson<T>(dataJson);
    return MixinResponse<T>(data);
  }

  T data;

  static Future<MixinResponse<T>> request<T>(Future<Response> future) async {
    final response = (await future).data;
    return MixinResponse<T>.fromJson(response);
  }

  @override
  List<Object?> get props => [
        data,
      ];
}

dynamic generateJson<T>(dynamic json) {
  final type = T.toString();
  if (T is List || type.startsWith('List')) {
    final itemType = type.substring(5, type.length - 1);
    final tempList = _getListFromType(itemType);

    if (tempList == null) return _generateJsonForType(type, json);

    // ignore: avoid_dynamic_calls
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
    case 'UserSession':
      return UserSession.fromJson(json);
    case 'SignalKeyCount':
      return SignalKeyCount.fromJson(json);
    case 'Asset':
      return Asset.fromJson(json);
    case 'Snapshot':
      return Snapshot.fromJson(json);
    case 'PaymentResponse':
      return PaymentResponse.fromJson(json);
    case 'Ticker':
      return Ticker.fromJson(json);
    case 'AssetFee':
      return Asset.fromJson(json);
    case 'PendingDeposit':
      return PendingDeposit.fromJson(json);
    case 'Address':
      return Address.fromJson(json);
    case 'Fiat':
      return Fiat.fromJson(json);
  }
  return json;
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
    case 'UserSession':
      return <UserSession>[];
    case 'Asset':
      return <Asset>[];
    case 'Snapshot':
      return <Snapshot>[];
    case 'PendingDeposit':
      return <PendingDeposit>[];
    case 'Address':
      return <Address>[];
    case 'Fiat':
      return <Fiat>[];
  }
  throw Exception('Unknown type $type');
}
