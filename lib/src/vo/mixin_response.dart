import 'package:json_annotation/json_annotation.dart';

import 'mixin_error.dart';
import 'user.dart';
import 'app.dart';
import 'provisioning.dart';

class MixinResponse extends Object {
  @JsonKey(name: 'error')
  MixinError error;

  @JsonKey(name: 'data')
  dynamic data;

  MixinResponse(
    this.error,
    this.data,
  );

  MixinResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'] == null
        ? null
        : MixinError.fromJson(json['error'] as Map<String, dynamic>);

    var dataJson = json['data'];
    if (dataJson is Map<String, dynamic>) {
      data = dataJson;
    } else {
      data = dataJson as List<dynamic>;
    }
  }

  Map<String, dynamic> toJson(MixinResponse instance) => <String, dynamic>{
        'error': instance.error,
        'data': instance.data,
      };

  void handleResponse<T>({Function onSuccess, Function onFailure}) {
    if (error != null) {
      onFailure(error);
    } else {
      var result = generateJson<T>(data);
      onSuccess(result);
    }
  }
}

// ignore: always_declare_return_types
generateJson<T>(json) {
  var type = T.toString();
  if (T is List || type.startsWith('List')) {
    var itemType = type.substring(5, type.length - 1);
    var tempList = _getListFromType(itemType);
    json.forEach((itemJson) {
      tempList.add(generateJsonForType(itemType, itemJson));
    });
    return tempList as T;
  } else {
    return generateJsonForType(type, json);
  }
}

// ignore: always_declare_return_types
generateJsonForType(type, json) {
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
    case 'BannerEntity':
      return <App>[];
  }
  return null;
}
