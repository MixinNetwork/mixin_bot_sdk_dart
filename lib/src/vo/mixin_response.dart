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
  if (T is List) {
    var itemType = type.substring(5, type.length - 1);
    return json
        ?.map((e) => e == null ? null : generateJsonForType(itemType, e))
        ?.toList();
  } else {
    return generateJsonForType(type, json);
  }
}

// ignore: always_declare_return_types
generateJsonForType(type, json) {
  switch (type) {
    case 'User':
      return User.fromJson(json);
    case 'List<User>': // need remove
      var users = json as List<dynamic>;
      return users.map((u) => User.fromJson(u)).toList();
    case 'App':
      return App.fromJson(json);
    case 'Provisioning':
      return Provisioning.fromJson(json);
  }
  throw Exception('Unknown type');
}
