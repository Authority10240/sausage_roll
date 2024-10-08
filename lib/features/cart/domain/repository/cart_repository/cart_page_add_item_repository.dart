import 'package:dartz/dartz.dart';
import 'package:sausage_roll/core/base_classes/base_repository.dart';
import 'package:sausage_roll/core/failures/base_failure.dart';
import 'package:sausage_roll/features/cart/domain/entities/cart_roll_entity.dart';

abstract class CartPageAddItemRepository extends BaseRepository<
    CartPageAddItemRepositoryParams, Either<BaseFailure, bool>> {}

class CartPageAddItemRepositoryParams extends BaseRepositoryParams {
  final CartRollEntity sausageRollEntity;

  CartPageAddItemRepositoryParams({required this.sausageRollEntity});
}
