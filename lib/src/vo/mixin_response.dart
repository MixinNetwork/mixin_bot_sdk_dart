import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class MixinResponse<T> with EquatableMixin {
  MixinResponse(
    this.data,
  );

  factory MixinResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) parser) {
    final dataJson = json['data'];
    final dynamic data = dataJson == null ? null : parser(dataJson);
    return MixinResponse<T>(data);
  }

  T data;

  static Future<MixinResponse<T>> request<T>(
      Future<Response> future, T Function(dynamic) parser) async {
    final response = (await future).data;
    return MixinResponse<T>.fromJson(response, parser);
  }

  static Future<MixinResponse<List<T>>> requestList<T>(
      Future<Response> future, T Function(dynamic) parser) async {
    final response = (await future).data as Map<String, dynamic>;
    final dataJsonList = response['data'];
    assert(dataJsonList is List);
    return MixinResponse<List<T>>(
        (dataJsonList as List).map((e) => parser(e)).toList());
  }

  static Future<MixinResponse<void>> requestVoid(
      Future<Response> future) async {
    await future;
    return MixinResponse(null);
  }

  @override
  List<Object?> get props => [
        data,
      ];
}
