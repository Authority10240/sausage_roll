part of 'cart_bloc.dart';

@immutable
abstract class CartPageState extends BaseState {
  CartPageState({super.errorCode, super.errorMessage});
}

class CartPageInitState extends CartPageState {}

class CartPageAddItemState extends CartPageState {
  CartPageAddItemState({super.errorCode, super.errorMessage});
}

class CartPageRemoteItemState extends CartPageState {}

class CartPageGetItemsState extends CartPageState {}

class CartPageGetSausageRollState extends CartPageState {
  CartPageGetSausageRollState(
      {this.sausageRollEntity, super.errorMessage, super.errorCode});

  CartRollEntity? sausageRollEntity;
}
