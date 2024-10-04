import 'package:dartz/dartz.dart';
import 'package:sausage_roll/core/failures/base_failure.dart';

typedef ResultFuture<T> = Either<BaseFailure, T>;

typedef ResultFutureVoid = void;
