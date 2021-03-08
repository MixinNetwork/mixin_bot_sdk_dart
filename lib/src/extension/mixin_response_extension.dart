import '../vo/mixin_response.dart';

extension MixinResponseExtension on MixinResponse {
  void handleResponse(
      {required Function onSuccess, required Function onFailure}) {
    if (error != null) {
      onFailure(error);
    } else {
      onSuccess(data);
    }
  }
}
