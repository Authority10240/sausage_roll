import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:sausage_roll/core/utilities/json_utils.dart';
import 'package:sausage_roll/features/cart/data/data_source/remote/sausage_roll_remote_data_source.dart';
import 'package:sausage_roll/features/cart/data/models/cart_model_response/sausage_roll_model.dart';
import 'package:sausage_roll/features/cart/domain/entities/sausage_roll_entity.dart';

@Singleton(as: SausageRollRemoteDataSource)
class SausageRollRemoteDataSourceImpl extends SausageRollRemoteDataSource {
  @override
  Future<SausageRollEntity> cartPageGetSausageRoll() async {
    try {
      return SausageRollModel.fromJson(
          json.decode(await jsonData('sausage_roll.json')));
    } catch (ex) {
      rethrow;
    }
  }
}
