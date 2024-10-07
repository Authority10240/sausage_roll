import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sausage_roll/core/base_classes/base_state.dart';
import 'package:sausage_roll/core/failures/base_failure.dart';
import 'package:sausage_roll/core/failures/runtime_exception.dart';
import 'package:sausage_roll/features/cart/data/models/cart_model_response/sausage_roll_model.dart';
import 'package:sausage_roll/features/cart/domain/entities/cart_roll_entity.dart';
import 'package:sausage_roll/features/cart/domain/use_cases/cart_usecase/cart_page_add_item_usecase.dart';
import 'package:sausage_roll/features/cart/domain/use_cases/cart_usecase/cart_page_get_sausage_roll_usecase.dart';
import 'package:sausage_roll/features/cart/presentation/bloc/cart_bloc.dart';

class MockCartPageGetSausageRollUsecase extends Mock
    implements CartPageGetSausageRollUseCase {}

class MockCartPageAddItemUsecase extends Mock
    implements CartPageAddItemUseCase {}

void main() {
  CartBloc bloc;
  CartPageGetSausageRollUseCase mockCartPageGetSausageRollUsecase;
  CartPageAddItemUseCase mockCartPageAddItemUseCase;
  final tCartPageGetSausageRollUsecaseParams =
      CartPageGetSausageRollUseCaseParams();

  group('CartPageGetSausageRollEvent', () {
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

    const tErrorCode = '0000';
    const tErrorMessage = 'test Error';

    blocTest<CartBloc, CartPageState>(
        'Should emit [CartPageInintailState,CardPageGetSausageRoll'
        '(datastate: loading, success)] when successful data is recieved from usecase',
        build: () {
          mockCartPageGetSausageRollUsecase =
              MockCartPageGetSausageRollUsecase();
          mockCartPageAddItemUseCase = MockCartPageAddItemUsecase();
          bloc = CartBloc(
              cartPageGetSausageRollUseCase: mockCartPageGetSausageRollUsecase,
              cartPageAddItemUseCase: mockCartPageAddItemUseCase);

          when(() => mockCartPageGetSausageRollUsecase.call())
              .thenAnswer((_) async => Right(tSausageRollModel));
          return bloc;
        },
        act: (bloc) => bloc.add(CartPageGetSausageRollEvent()),
        expect: () => [
              CartPageGetSausageRollState()..dataState = DataState.loading,
              CartPageGetSausageRollState(sausageRollEntity: tSausageRollModel)
                ..dataState = DataState.success,
            ]);

    blocTest<CartBloc, CartPageState>(
        'Should emit [CartPageInintailState,CardPageGetSausageRoll'
        '(datastate: loading, error)] when successful data is recieved from usecase',
        build: () {
          mockCartPageGetSausageRollUsecase =
              MockCartPageGetSausageRollUsecase();
          mockCartPageAddItemUseCase = MockCartPageAddItemUsecase();
          bloc = CartBloc(
              cartPageGetSausageRollUseCase: mockCartPageGetSausageRollUsecase,
              cartPageAddItemUseCase: mockCartPageAddItemUseCase);

          when(() => mockCartPageGetSausageRollUsecase.call()).thenAnswer(
              (_) async => Left(RuntimeException(
                  errorCode: tErrorCode, message: tErrorMessage)));
          return bloc;
        },
        act: (bloc) => bloc.add(CartPageGetSausageRollEvent()),
        expect: () => [
              CartPageGetSausageRollState()..dataState = DataState.loading,
              CartPageGetSausageRollState(
                  errorCode: tErrorCode, errorMessage: tErrorMessage)
                ..dataState = DataState.error,
            ]);
  });
}
