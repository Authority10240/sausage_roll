import 'package:sausage_roll/features/cart/data/models/cart_model_response/sausage_roll_model.dart';

abstract class SausageRollLocalDataSource {
  Future<void> insertSausage({required SausageRollModel sausageRollModel});

  Future<void> deleteSausage({required SausageRollModel sausageRollModel});

  Future<List<SausageRollModel>> getAllSousages();
}
