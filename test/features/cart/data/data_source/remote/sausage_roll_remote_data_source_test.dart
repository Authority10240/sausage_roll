import 'package:flutter_test/flutter_test.dart';
import 'package:sausage_roll/features/cart/data/data_source/remote/sausage_roll_remote_data_source_impl.dart';
import 'dart:convert';

import 'package:sausage_roll/features/cart/data/models/cart_model_response/sausage_roll_model.dart';

void main() {
  SausageRollRemoteDataSourceImpl dataSourceImpl;

  final tSausageRollModel = SausageRollModel(
      id: 1,
      articleCode: '1000446',
      articleName: 'Sausage Roll',
      availableFrom: '2020-12-30T00:00:00Z',
      availableUntil: '2045-05-13T23:59:59Z',
      customerDescription: 'test description',
      dayParts: ['Breakfast', 'Lunch', 'Evening'],
      eatInPrice: 1.15,
      eatOutPrice: 1.05,
      imageUri:
          'https://articles.greggs.co.uk/images/1000446.png?1623244287449',
      internalDescription: 'Sausage Roll',
      shopCode: '1234',
      thumbnailUri:
          'https://articles.greggs.co.uk/images/1000446-thumb.png?1623244287450');

  group('get data from api/json file', () {
    test('get Sausage entity information from remote source', () async {
      dataSourceImpl = SausageRollRemoteDataSourceImpl();
      //arrange

      //act
      final result = await dataSourceImpl.cartPageGetSausageRoll();
      //assert
      expect(tSausageRollModel, result);
    });
  });
}
