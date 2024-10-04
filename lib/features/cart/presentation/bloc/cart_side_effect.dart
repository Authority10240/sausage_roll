part of 'cart_bloc.dart';

@immutable
abstract class CartPageSideEffect extends BaseSideEffect {}

class CartPageAddItemSideEffect extends CartPageSideEffect {}

class CartPageDeleteItemSideEffect extends CartPageSideEffect {}

class CartPageGetSausageRollSideEffect extends CartPageSideEffect {}
