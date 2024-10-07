import 'package:sausage_roll/features/sausage_roll/data/models/cart_model_response/sausage_roll_model.dart';
import 'package:sausage_roll/features/sausage_roll/domain/entities/sausage_roll_entity.dart';

abstract class SausageCartDataSource {
  Future<List<SausageRollModel>> getAllSausages();
}
