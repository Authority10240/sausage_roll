import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sausage_roll/features/cart/data/models/cart_model_response/sausage_roll_model.dart';
import 'package:sausage_roll/features/cart/domain/entities/sausage_roll_entity.dart';

import '../../../../test_data/test_data_reader.dart';

void main() {
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

  test('should be a subclass of SausageRollEntity', () async {
    expect(tSausageRollModel, isA<SausageRollEntity>());
  });

  group('fromJson', () {
    test('should return a valid model when json data is List<String>',
        () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          json.decode(testData('sausage_roll.json'));
      // act
      final result = SausageRollModel.fromJson(jsonMap);
      //assert
      expect(result, tSausageRollModel);
    });

    test('should return a valid model when json date is String', () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          json.decode(testData('sausage_roll.json'));
      // act
      final result = SausageRollModel.fromJson(jsonMap);
      //assert
      expect(result, tSausageRollModel);
    });
  });

  group('toJson', () {
    test('should return json object from model', () {
      //arrange
      final result = tSausageRollModel.toJson();
      final Map<String, dynamic> jsonMap =
          json.decode(testData('sausage_roll.json'));
      //act

      //assert
      expect(result, jsonMap);
    });
  });
}
