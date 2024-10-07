import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:sausage_roll/core/base_classes/base_bloc.dart';
import 'package:sausage_roll/core/base_classes/base_event.dart';
import 'package:sausage_roll/core/base_classes/base_side_effect.dart';
import 'package:sausage_roll/core/base_classes/base_state.dart';
import 'package:sausage_roll/core/failures/base_failure.dart';
import 'package:sausage_roll/core/utilities/type_defs.dart';
import 'package:sausage_roll/features/cart/data/models/cart_model_response/sausage_roll_model.dart';
import 'package:sausage_roll/features/cart/domain/entities/cart_roll_entity.dart';
import 'package:sausage_roll/features/cart/domain/use_cases/cart_usecase/cart_page_add_item_usecase.dart';
import 'package:sausage_roll/features/cart/domain/use_cases/cart_usecase/cart_page_get_sausage_roll_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_side_effect.dart';

@injectable
class CartBloc
    extends BaseBloc<CartPageEvent, CartPageState, CartPageSideEffect> {
  CartBloc(
      {required this.cartPageGetSausageRollUseCase,
      required this.cartPageAddItemUseCase})
      : super(CartPageInitState()) {
    on<CartPageGetSausageRollEvent>(
        (event, emit) => _onCartPageGetSausageRollEvent(event, emit));
    on<CartPageAddItemEvent>(
        (event, emit) => _onCartPageAdditemEvent(event, emit));

    on<CartPageRemoveItemEvent>(
        (event, emit) => _onCartPageRemoveItemEvent(event, emit));

    on<CartPageGetItemsEvent>(
        (event, emit) => _onCartPageGetItemsEvent(event, emit));
  }

  final CartPageGetSausageRollUseCase cartPageGetSausageRollUseCase;
  final CartPageAddItemUseCase cartPageAddItemUseCase;

  Future<void> _onCartPageGetSausageRollEvent(
      CartPageGetSausageRollEvent event, Emitter<CartPageState> emit) async {
    emit(CartPageGetSausageRollState()..dataState = DataState.loading);
    ResultFuture result = await cartPageGetSausageRollUseCase.call();

    result.fold((error) {
      emit(CartPageGetSausageRollState(
          errorCode: error.errorCode, errorMessage: error.message)
        ..dataState = DataState.error);
    }, (model) {
      emit(CartPageGetSausageRollState(sausageRollEntity: model)
        ..dataState = DataState.success);
    });
  }

  Future<void> _onCartPageAdditemEvent(
      CartPageAddItemEvent event, Emitter<CartPageState> emit) async {
    emitSideEffect(CartPageAddItemSideEffect()..dataState = DataState.loading);
    try {
      Either<BaseFailure, bool> result = await cartPageAddItemUseCase.call(
          params: CartPageAddItemUseCaseParams(
              sausageRollEntity: event.sausageRollEntity));
      result.fold((error) {
        emitSideEffect(CartPageAddItemSideEffect(
            errorCode: error.errorCode, errorMessage: error.message)
          ..dataState = DataState.error);
      }, (model) {
        emitSideEffect(
            CartPageAddItemSideEffect()..dataState = DataState.success);
      });
    } catch (ex) {
      emitSideEffect(CartPageAddItemSideEffect(
          errorCode: 'bloc', errorMessage: ex.toString())
        ..dataState = DataState.error);
    }
  }

  Future<void> _onCartPageRemoveItemEvent(
      CartPageRemoveItemEvent event, Emitter<CartPageState> emit) async {}

  Future<void> _onCartPageGetItemsEvent(
      CartPageGetItemsEvent event, Emitter<CartPageState> emit) async {}
}
