import 'package:json_annotation/json_annotation.dart';

class JsonStringToInt implements JsonConverter<int, dynamic> {
  const JsonStringToInt();

  @override
  int fromJson(dynamic json) {
    if (json is num) {
      return json.toInt();
    }
    return int.tryParse(json.toString()) ?? 0;
  }

  @override
  int toJson(int object) => object;
}
