import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:sausage_roll/core/base_classes/base_page.dart';
import 'package:sausage_roll/core/base_classes/base_state.dart';
import 'package:sausage_roll/core/extensions/date_extension.dart';
import 'package:sausage_roll/core/extensions/numb_extensions.dart';
import 'package:sausage_roll/core/locator.dart';
import 'package:sausage_roll/core/widgets/preloader_widget.dart';
import 'package:sausage_roll/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:sausage_roll/features/cart/presentation/widgets/availability_widget.dart';
import 'package:sausage_roll/features/cart/presentation/widgets/custom_button.dart';
import 'package:sausage_roll/generated/l10n.dart';
import 'package:sausage_roll/core/extensions/numb_extensions.dart';

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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.sizeOf(context).height / 3,
                            width: MediaQuery.sizeOf(context).width,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 79, 71, 155),
                                Color.fromARGB(255, 43, 40, 73),
                              ]),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40)),
                            ),
                            child: CachedNetworkImage(
                                imageUrl: state.sausageRollEntity!.imageUri),
                          ),
                          40.height,
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.sausageRollEntity!.internalDescription,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 43, 40, 73),
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                AvailabilityWidget(
                                  curvedLeft: true,
                                  caption: appLocalizations.offerAvailable,
                                  width: MediaQuery.sizeOf(context).width / 3,
                                  height:
                                      MediaQuery.sizeOf(context).height / 20,
                                ),
                              ],
                            ),
                          ),
                          10.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AvailabilityWidget(
                                  centerCaption: false,
                                  caption:
                                      "${appLocalizations.eatIn} ${state.sausageRollEntity!.eatInPrice.toCurrency}",
                                  height:
                                      MediaQuery.sizeOf(context).height / 30,
                                  width: MediaQuery.sizeOf(context).width / 4),
                              AvailabilityWidget(
                                  curvedLeft: true,
                                  caption: state
                                      .sausageRollEntity!.availableFrom
                                      .toFormattedDate(),
                                  height:
                                      MediaQuery.sizeOf(context).height / 30,
                                  width: MediaQuery.sizeOf(context).width / 4)
                            ],
                          ),
                          10.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AvailabilityWidget(
                                  centerCaption: false,
                                  caption:
                                      "${appLocalizations.eatOut} ${state.sausageRollEntity!.eatOutPrice.toCurrency}",
                                  height:
                                      MediaQuery.sizeOf(context).height / 30,
                                  width: MediaQuery.sizeOf(context).width / 4),
                              AvailabilityWidget(
                                  curvedLeft: true,
                                  caption: state
                                      .sausageRollEntity!.availableUntil
                                      .toFormattedDate(),
                                  height:
                                      MediaQuery.sizeOf(context).height / 30,
                                  width: MediaQuery.sizeOf(context).width / 4)
                            ],
                          ),
                          50.height,
                          Container(
                              height: MediaQuery.sizeOf(context).height / 2.6,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color.fromARGB(255, 79, 71, 155),
                                  Color.fromARGB(255, 43, 40, 73),
                                ]),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40)),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30, left: 20, right: 20),
                                    child: Text(
                                      state.sausageRollEntity!
                                          .customerDescription,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                  CustomButton(
                                    caption: appLocalizations.addToCArt,
                                    onTap: () {},
                                  )
                                ],
                              )),
                        ],
                      ))
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
