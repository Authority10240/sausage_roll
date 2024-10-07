import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sausage_roll/core/base_classes/base_usecase.dart';
import 'package:sausage_roll/core/failures/base_failure.dart';
import 'package:sausage_roll/core/utilities/type_defs.dart';
import 'package:sausage_roll/features/cart/domain/entities/cart_roll_entity.dart';
import 'package:sausage_roll/features/cart/domain/repository/cart_repository/cart_page_get_sausage_roll_repository.dart';

@Injectable()
class CartPageGetSausageRollUseCase extends BaseUseCase<
    CartPageGetSausageRollUseCaseParams, Either<BaseFailure, CartRollEntity>> {
  final CartPageGetSausageRollRepository cartPageGetSausageRollRepository;

  CartPageGetSausageRollUseCase(
      {required this.cartPageGetSausageRollRepository});

  @override
  Future<Either<BaseFailure, CartRollEntity>> call(
      {CartPageGetSausageRollUseCaseParams? params}) async {
    return await cartPageGetSausageRollRepository.call();
  }
}

class CartPageGetSausageRollUseCaseParams extends BaseUseCaseParams {}
