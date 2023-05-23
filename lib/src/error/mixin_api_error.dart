import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';

class MixinApiError extends DioError {
  MixinApiError({
    required super.requestOptions,
    required Response<dynamic> super.response,
    required MixinError super.error,
  });
}
