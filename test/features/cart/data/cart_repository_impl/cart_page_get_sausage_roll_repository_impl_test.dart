import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sausage_roll/features/cart/data/data_source/remote/sausage_roll_remote_data_source.dart';
import 'package:sausage_roll/features/cart/data/models/cart_model_response/sausage_roll_model.dart';
import 'package:sausage_roll/features/cart/data/repository_impl/cart_repository_impl/cart_page_get_sausage_roll_repository_impl.dart';

class MockSausageRollRemoteDataSource extends Mock
    implements SausageRollRemoteDataSource {}

void main() {
  setUpAll(() {});

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

  test(
      "should return remote data when a call to remote data source is successful",
      () async {
    final mockSausageRollRemoteDataSource = MockSausageRollRemoteDataSource();
    final cartPageGetSausageRollRepositoryImpl =
        CartPageGetSausageRollRepositoryImpl(
            sausageRollRemoteDataSource: mockSausageRollRemoteDataSource);

    //arrange
    when(mockSausageRollRemoteDataSource.cartPageGetSausageRoll)
        .thenAnswer((_) async => tSausageRollModel);

    //act
    final result = await cartPageGetSausageRollRepositoryImpl.call();

    //assert
    verify(mockSausageRollRemoteDataSource.cartPageGetSausageRoll);
    expect(result, equals(Right(tSausageRollModel)));
    verifyNoMoreInteractions(mockSausageRollRemoteDataSource);
  });
}
