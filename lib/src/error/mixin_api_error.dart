import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';

class MixinApiError extends DioError {
  MixinApiError({
    required RequestOptions requestOptions,
    required Response response,
    required MixinError error,
  }) : super(
          requestOptions: requestOptions,
          response: response,
          error: error,
        );
}
