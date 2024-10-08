import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sausage_roll/core/failures/base_failure.dart';
import 'package:sausage_roll/core/failures/runtime_exception.dart';
import 'package:sausage_roll/features/cart/data/models/cart_model_response/sausage_roll_model.dart';
import 'package:sausage_roll/features/cart/domain/entities/cart_roll_entity.dart';
import 'package:sausage_roll/features/cart/domain/repository/cart_repository/cart_page_get_sausage_roll_repository.dart';
import 'package:sausage_roll/features/cart/domain/use_cases/cart_usecase/cart_page_get_sausage_roll_usecase.dart';

class MockCartPageGetSausageRollRepository extends Mock
    implements CartPageGetSausageRollRepository {}

void main() {
  CartPageGetSausageRollUseCase cartPageGetSausageRollUseCase;

  MockCartPageGetSausageRollRepository mockCartPageGetSausageRollRepository;

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

  test("should return remote data when a call to repository is successful",
      () async {
    mockCartPageGetSausageRollRepository =
        MockCartPageGetSausageRollRepository();
    cartPageGetSausageRollUseCase = CartPageGetSausageRollUseCase(
        cartPageGetSausageRollRepository: mockCartPageGetSausageRollRepository);

    final expected = Right<BaseFailure, CartRollEntity>(tSausageRollModel);

    //arrange

    when<Future<Either<BaseFailure, CartRollEntity>>>(
            mockCartPageGetSausageRollRepository.call)
        .thenAnswer((_) async => expected);

    //act
    final result = await cartPageGetSausageRollUseCase.call();

    //assert
    verify(mockCartPageGetSausageRollRepository.call);
    expect(result, equals(Right(tSausageRollModel)));
    verifyNoMoreInteractions(mockCartPageGetSausageRollRepository);
  });

  group('return failures for each failure scenario', () {
    mockCartPageGetSausageRollRepository =
        MockCartPageGetSausageRollRepository();
    cartPageGetSausageRollUseCase = CartPageGetSausageRollUseCase(
        cartPageGetSausageRollRepository: mockCartPageGetSausageRollRepository);
    test('return runtime failure on server error', () async {
      final expected = Left<BaseFailure, CartRollEntity>(
          RuntimeException(errorCode: '0000', message: 'test error'));

      //arrange
      when<Future<Either<BaseFailure, CartRollEntity>>>(
              mockCartPageGetSausageRollRepository.call)
          .thenAnswer((_) async => expected);

      //act
      final result = await cartPageGetSausageRollUseCase.call();

      //assert
      verify(mockCartPageGetSausageRollRepository.call);
      expect(result, equals(expected));
      verifyNoMoreInteractions(mockCartPageGetSausageRollRepository);
    });
  });
}
