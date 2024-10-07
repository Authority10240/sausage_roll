import 'package:sausage_roll/features/sausage_roll/domain/entities/sausage_roll_entity.dart';

abstract class SausageCartDataSource {
  Future<List<SausageRollEntity>> getAllSausages();
}
