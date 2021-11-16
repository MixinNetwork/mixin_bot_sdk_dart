import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class MixinResponse<T> with EquatableMixin {
  MixinResponse(
    this.data,
  );

  factory MixinResponse._fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) parser) {
    final dataJson = json['data'] as Map<String, dynamic>;
    final data = parser(dataJson);
    return MixinResponse<T>(data);
  }

  T data;

  static Future<MixinResponse<T>> request<T>(
      Future<Response<Map<String, dynamic>>> future,
      T Function(Map<String, dynamic>) parser) async {
    final response = (await future).data!;
    return MixinResponse<T>._fromJson(response, parser);
  }

  static Future<MixinResponse<List<T>>> requestList<T>(
      Future<Response<Map<String, dynamic>>> future,
      T Function(Map<String, dynamic>) parser) async {
    final response = (await future).data!;
    final dataJsonList = response['data'] as List<dynamic>;
    return MixinResponse<List<T>>(dataJsonList
        .map((dynamic e) => parser(e as Map<String, dynamic>))
        .toList());
  }

  static Future<MixinResponse<void>> requestVoid(
    Future<Response<Map<String, dynamic>>> future,
  ) async {
    await future;
    return MixinResponse(null);
  }

  @override
  List<Object?> get props => [
        data,
      ];
}
