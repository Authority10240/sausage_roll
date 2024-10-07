import 'package:sausage_roll/features/cart/data/models/cart_model_response/sausage_roll_model.dart';

abstract class SausageRollLocalDataSource {
  Future<bool> insertSausage({required SausageRollModel sausageRollModel});

  Future<bool> deleteSausage({required SausageRollModel sausageRollModel});

  Future<List<SausageRollModel>> getAllSousages();
}
