import 'package:sausage_roll/features/cart/data/models/cart_model_response/sausage_roll_model.dart';
import 'package:sausage_roll/features/cart/domain/entities/sausage_roll_entity.dart';

abstract class SausageRollRemoteDataSource {
  Future<SausageRollEntity> cartPageGetSausageRoll();
}
