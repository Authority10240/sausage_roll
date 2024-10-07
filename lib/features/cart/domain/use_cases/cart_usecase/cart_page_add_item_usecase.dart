import 'package:dartz/dartz.dart';
import 'package:sausage_roll/core/base_classes/base_usecase.dart';
import 'package:sausage_roll/core/failures/base_failure.dart';
import 'package:sausage_roll/features/cart/domain/entities/sausage_roll_entity.dart';
import 'package:sausage_roll/features/cart/domain/repository/cart_repository/cart_page_add_item_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CartPageAddItemUseCase extends BaseUseCase<CartPageAddItemUseCaseParams,
    Either<BaseFailure, bool>> {
  final CartPageAddItemRepository cartPageAddItemRepository;

  CartPageAddItemUseCase({required this.cartPageAddItemRepository});

  @override
  Future<Either<BaseFailure, bool>> call(
      {CartPageAddItemUseCaseParams? params}) async {
    try {
      return await cartPageAddItemRepository.call(
          params: CartPageAddItemRepositoryParams(
              sausageRollEntity: params!.sausageRollEntity));
    } catch (ex) {
      return left(BaseFailure.factory(ex: ex));
    }
  }
}

class CartPageAddItemUseCaseParams extends BaseUseCaseParams {
  CartPageAddItemUseCaseParams({required this.sausageRollEntity});

  final SausageRollEntity sausageRollEntity;
}
