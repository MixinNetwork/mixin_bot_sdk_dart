import '../vo/mixin_response.dart';

extension MixinResponseExtension on MixinResponse {
  void handleResponse({Function onSuccess, Function onFailure}) {
    if (error != null) {
      onFailure(error);
    } else {
      onSuccess(data);
    }
  }
}
