import 'package:injectable/injectable.dart';
import 'package:sausage_roll/core/sembast_database/custom_sembast_database.dart';
import 'package:sausage_roll/features/sausage_roll/data/data_sources/local/sausage_cart_data_source.dart';
import 'package:sausage_roll/features/sausage_roll/data/models/cart_model_response/sausage_roll_model.dart';
import 'package:sausage_roll/features/sausage_roll/domain/entities/sausage_roll_entity.dart';
import 'package:sembast/sembast_io.dart';

@Singleton(as: SausageCartDataSource)
class SausageCartDataSourceImpl extends SausageCartDataSource {
  SausageCartDataSourceImpl({required this.db});

  final CustomSembastDatabase db;
  static const String cartName = 'SHOPPING_CART';

  final _cartStore = intMapStoreFactory.store(cartName);
  @override
  Future<List<SausageRollModel>> getAllSausages() async {
    final records = await _cartStore.find(await db.database);

    return records.map((element) {
      SausageRollModel sausageRollModel =
          SausageRollModel.fromJson(element.value);
      sausageRollModel.id = element.key;
      return sausageRollModel;
    }).toList();
  }
}
