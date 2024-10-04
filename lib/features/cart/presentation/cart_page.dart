import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:sausage_roll/core/base_classes/base_page.dart';
import 'package:sausage_roll/core/base_classes/base_state.dart';
import 'package:sausage_roll/core/extensions/numb_extensions.dart';
import 'package:sausage_roll/core/locator.dart';
import 'package:sausage_roll/core/widgets/preloader_widget.dart';
import 'package:sausage_roll/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:sausage_roll/generated/l10n.dart';

class CartPage extends BasePage {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends BasePageState<CartPage, CartBloc> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBloc().add(CartPageGetSausageRollEvent());
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumerWithSideEffects<CartBloc, CartPageState,
        CartPageSideEffect>(
      bloc: baseBloc,
      sideEffectsListener: (context, sideEffect) {},
      listener: (context, state) {},
      builder: (context, state) {
        return state is CartPageGetSausageRollState
            ? state.dataState == DataState.loading
                ? preloaderWidget()
                : state.dataState == DataState.success
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            20.height,
                            Text(appLocalizations.welcomeToSausageRollHouse)
                          ],
                        ),
                      )
                    : Center(
                        child: Text(
                            "${appLocalizations.anErrorHasOccured}:${state.errorMessage}"))
            : Container();
      },
    );
  }

  @override
  CartBloc initBloc() {
    return locator<CartBloc>();
  }

  @override
  S initLocalization() {
    return locator<S>();
  }
}
