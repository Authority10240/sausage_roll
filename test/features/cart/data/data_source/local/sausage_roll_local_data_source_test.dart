import 'dart:convert';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sausage_roll/core/sembast_database/sembast_database.dart';
import 'package:sausage_roll/features/cart/data/data_source/local/sausage_roll-local_data_source_impl.dart';
import 'package:sausage_roll/features/cart/data/models/cart_model_response/sausage_roll_model.dart';
import 'package:sausage_roll/features/cart/domain/entities/sausage_roll_entity.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast/src/api/finder.dart' as database;

import '../../../../../test_data/test_data_reader.dart';

class MockSembastDatabase extends Mock implements SembastDatabase {}

void main() {
  SausageRolllocalDataSourceImpl dataSourceImpl;
  const String cartName = 'SHOPPING_CART';
  StoreRef _cartStore;

  setUp(() async {});
}
