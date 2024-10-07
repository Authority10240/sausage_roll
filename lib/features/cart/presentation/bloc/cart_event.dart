part of 'cart_bloc.dart';

@immutable
abstract class CartPageEvent extends BaseEvent {}

class CartPageLoadCart extends CartPageEvent {}

class CartPageAddItemEvent extends CartPageEvent {
  CartPageAddItemEvent({required this.sausageRollEntity});
  final CartRollEntity sausageRollEntity;
}

class CartPageRemoveItemEvent extends CartPageEvent {
  CartPageRemoveItemEvent({required this.sausageRollModel});
  final SausageRollModel sausageRollModel;
}

class CartPageGetItemsEvent extends CartPageEvent {}

class CartPageGetSausageRollEvent extends CartPageEvent {}
