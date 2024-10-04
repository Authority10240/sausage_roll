import 'runtime_exception.dart';

abstract class BaseFailure {
  factory BaseFailure.factory({required Object ex}) {
    return RuntimeException(errorCode: '0000', message: ex.toString());
  }

  BaseFailure();

  late String? message;

  late String? errorCode;
}
