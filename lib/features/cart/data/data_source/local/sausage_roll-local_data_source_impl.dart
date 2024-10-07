import 'package:injectable/injectable.dart';
import 'package:sausage_roll/features/cart/data/data_source/local/sausage_roll_local_data_source.dart';
import 'package:sausage_roll/core/sembast_database/custom_sembast_database.dart';
import 'package:sausage_roll/features/cart/data/models/cart_model_response/sausage_roll_model.dart';
import 'package:sembast/sembast_io.dart';

@Singleton(as: SausageRollLocalDataSource)
class SausageRolllocalDataSourceImpl extends SausageRollLocalDataSource {
  SausageRolllocalDataSourceImpl({required this.db});
  final CustomSembastDatabase db;
  static const String cartName = 'SHOPPING_CART';

  final _cartStore = intMapStoreFactory.store(cartName);

  /* @override
  Future<void> insertSausage(
      {required SausageRollModel sausageRollModel}) async {
    await _cartStore.add(await db.database, sausageRollModel.toJson());
  }*/

  @override
  Future<bool> deleteSausage(
      {required SausageRollModel sausageRollModel}) async {
    final finder = Finder(filter: Filter.byKey(sausageRollModel.id));
    await _cartStore.delete(await db.database, finder: finder);
    return true;
  }

  @override
  Future<bool> insertSausage(
      {required SausageRollModel sausageRollModel}) async {
    try {
      _cartStore.add(await db.database, sausageRollModel.toJson());
      return true;
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<List<SausageRollModel>> getAllSousages() async {
    final records = await _cartStore.find(await db.database);

    return records.map((element) {
      SausageRollModel sausageRollModel =
          SausageRollModel.fromJson(element.value);
      sausageRollModel.id = element.key;
      return sausageRollModel;
    }).toList();
  }
}
