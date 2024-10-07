import 'package:dartz/dartz.dart';
import 'package:sausage_roll/core/base_classes/base_repository.dart';
import 'package:sausage_roll/core/failures/base_failure.dart';
import 'package:sausage_roll/core/utilities/type_defs.dart';
import 'package:sausage_roll/features/cart/domain/entities/sausage_roll_entity.dart';

abstract class CartPageGetSausageRollRepository extends BaseRepository<
    CartPageGetSausageRollRepositoryParams,
    Either<BaseFailure, SausageRollEntity>> {}

class CartPageGetSausageRollRepositoryParams extends BaseRepositoryParams {}
