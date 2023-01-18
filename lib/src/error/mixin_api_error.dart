import 'package:diox/diox.dart';

import '../../mixin_bot_sdk_dart.dart';

class MixinApiError extends DioError {
  MixinApiError({
    required RequestOptions requestOptions,
    required Response<dynamic> response,
    required MixinError error,
  }) : super(
          requestOptions: requestOptions,
          response: response,
          error: error,
        );
}
