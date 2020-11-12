import 'package:json_annotation/json_annotation.dart';

import 'mixin_error.dart';
import 'user.dart';
import 'app.dart';
import 'provisioning.dart';

part 'mixin_response.g.dart';

@JsonSerializable()
class MixinResponse extends Object {
  @JsonKey(name: 'error')
  MixinError error;

  @JsonKey(name: 'data')
  Map<String, dynamic> data;

  MixinResponse(
    this.error,
    this.data,
  );

  factory MixinResponse.fromJson(Map<String, dynamic> json) =>
      _$MixinResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MixinResponseToJson(this);

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
    case 'App':
      return App.fromJson(json);
    case 'Provisioning':
      return Provisioning.fromJson(json);
  }
  throw Exception('Unknown type');
}
