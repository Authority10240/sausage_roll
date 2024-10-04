

import 'base_failure.dart';

class RuntimeException extends BaseFailure{
  RuntimeException({required String errorCode, required String message}){
    super.errorCode = errorCode;
    super.message = message;
  }
}