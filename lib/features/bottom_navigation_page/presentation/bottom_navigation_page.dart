import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:sausage_roll/core/base_classes/base_page.dart';
import 'package:sausage_roll/core/locator.dart';
import 'package:sausage_roll/features/bottom_navigation_page/presentation/bloc/bottom_navigation_page_bloc.dart';
import 'package:sausage_roll/features/bottom_navigation_page/presentation/bloc/widgets/nav_bar_items.dart';
import 'package:sausage_roll/features/cart/presentation/cart_page.dart';
import 'package:sausage_roll/features/sausage_roll_page/presentation/sausage_roll_page_page.dart';
import 'package:sausage_roll/generated/l10n.dart';

class BottomNavigationPage extends BasePage {
  const BottomNavigationPage({super.key});

  @override
  _BottomNavigationPagePageState createState() =>
      _BottomNavigationPagePageState();
}

class _BottomNavigationPagePageState
    extends BasePageState<BottomNavigationPage, BottomNavigationPageBloc> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<BottomNavigationPageBloc,
        BottomNavigationPagePageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return PersistentTabView(
          context,
          backgroundColor: Color.fromARGB(255, 79, 71, 155),
          screens: const [CartPage(), SausageRollPage()],
          items: navBarItems,
        );
      },
    );
  }

  @override
  BottomNavigationPageBloc initBloc() {
    return locator<BottomNavigationPageBloc>();
  }

  @override
  S initLocalization() {
    return locator<S>();
  }
}
