import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sausage_roll/core/failures/base_failure.dart';
import 'package:sausage_roll/features/cart/data/data_source/local/sausage_roll_local_data_source.dart';
import 'package:sausage_roll/features/cart/data/models/cart_model_response/sausage_roll_model.dart';
import 'package:sausage_roll/features/cart/domain/repository/cart_repository/cart_page_add_item_repository.dart';

@Injectable(as: CartPageAddItemRepository)
class CartPageAddItemRepositoryImpl extends CartPageAddItemRepository {
  CartPageAddItemRepositoryImpl({required this.sausageRollLocalDataSource});

  final SausageRollLocalDataSource sausageRollLocalDataSource;

  @override
  Future<Either<BaseFailure, bool>> call(
      {CartPageAddItemRepositoryParams? params}) async {
    try {
      return Right(await sausageRollLocalDataSource.insertSausage(
          sausageRollModel:
              SausageRollModel.fromEntity(entity: params!.sausageRollEntity)));
    } catch (ex) {
      return Left(BaseFailure.factory(ex: ex));
    }
  }
}
