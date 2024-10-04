import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sausage_roll/core/base_classes/back_end_calls.dart';
import 'package:sausage_roll/core/failures/base_failure.dart';
import 'package:sausage_roll/core/utilities/type_defs.dart';

import 'package:sausage_roll/features/cart/data/data_source/remote/sausage_roll_remote_data_source.dart';
import 'package:sausage_roll/features/cart/data/models/cart_model_response/sausage_roll_model.dart';
import 'package:sausage_roll/features/cart/domain/entities/sausage_roll_entity.dart';
import 'package:sausage_roll/features/cart/domain/repository/cart_repository/cart_page_get_sausage_roll_repository.dart';

@Injectable(as: CartPageGetSausageRollRepository)
class CartPageGetSausageRollRepositoryImpl
    extends CartPageGetSausageRollRepository {
  CartPageGetSausageRollRepositoryImpl(
      {required this.sausageRollRemoteDataSource});

  final SausageRollRemoteDataSource sausageRollRemoteDataSource;

  @override
  Future<ResultFuture<SausageRollEntity>> call(
      {CartPageGetSausageRollRepositoryParams? params}) async {
    try {
      return Right(await sausageRollRemoteDataSource.cartPageGetSausageRoll());
    } catch (ex) {
      return Left(BaseFailure.factory(ex: ex));
    }
  }
}
