import '../failures/base_failure.dart';

Future<void> safeBackEndCalls<T>({
  required Future<T> apiRequest,
  required Function(T? model)? onSuccess,
  required Function(BaseFailure? error)? onError,
}) async {
  try {
    onSuccess?.call(await apiRequest);
  } on Exception catch (ex) {
    onError?.call(BaseFailure.factory(ex: ex));
  }
}
