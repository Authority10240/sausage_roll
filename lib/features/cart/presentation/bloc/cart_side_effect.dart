part of 'cart_bloc.dart';

@immutable
abstract class CartPageSideEffect extends BaseSideEffect {
  CartPageSideEffect({super.errorCode, super.errorMessage, super.properties});
}

class CartPageAddItemSideEffect extends CartPageSideEffect {
  CartPageAddItemSideEffect(
      {super.errorCode, super.errorMessage, super.properties});
}

class CartPageDeleteItemSideEffect extends CartPageSideEffect {}

class CartPageGetSausageRollSideEffect extends CartPageSideEffect {}
