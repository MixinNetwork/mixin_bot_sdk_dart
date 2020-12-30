import 'package:dio/src/response.dart';
import 'package:equatable/equatable.dart';

import 'mixin_error.dart';
import 'user.dart';
import 'app.dart';
import 'provisioning.dart';

class MixinResponse<T> with EquatableMixin {
  MixinError error;

  T data;

  MixinResponse(
    this.error,
    this.data,
  );

  factory MixinResponse.fromJson(Map<String, dynamic> json) {
    var error = json['error'] == null
        ? null
        : MixinError.fromJson(json['error'] as Map<String, dynamic>);

    var dataJson = json['data'];
    var data = dataJson == null ? null : generateJson<T>(dataJson);
    return MixinResponse<T>(error, data);
  }

  static Future<MixinResponse<T>> request<T>(Future<Response> future) async {
    var response = (await future).data;
    return MixinResponse<T>.fromJson(response);
  }

  @override
  List<Object> get props => [
        error,
        data,
      ];
}

dynamic generateJson<T>(json) {
  var type = T.toString();
  if (T is List || type.startsWith('List')) {
    var itemType = type.substring(5, type.length - 1);
    var tempList = _getListFromType(itemType);
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
    case 'User':
      return User.fromJson(json);
    case 'App':
      return App.fromJson(json);
    case 'Provisioning':
      return Provisioning.fromJson(json);
  }
  throw Exception('Unknown type');
}

List _getListFromType(String type) {
  switch (type) {
    case 'User':
      return <User>[];
    case 'App':
      return <App>[];
  }
  return null;
}
