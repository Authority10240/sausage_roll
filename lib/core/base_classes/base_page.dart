import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_bloc.dart';
import 'base_widget.dart';

abstract class BasePage extends BaseWidget {
  const BasePage({Key? key}) : super(key: key);
}

abstract class BasePageState<T extends BasePage, B extends BaseBloc> extends BaseWidgetState<T, B> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  bool subscribeToVisibilityEvents = false;

  BasePageState({this.subscribeToVisibilityEvents = false});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<B>(
      create: (context) => baseBloc,
      child: WillPopScope(
        onWillPop: onBackPressed,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: scaffoldBackgroundColor(),
          key: _scaffoldkey,
          appBar: buildAppbar(),
          bottomNavigationBar: bottomNavigationBar(),
          floatingActionButton: floatingActionButton(),
          body: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height / 14,
              bottom: MediaQuery.sizeOf(context).height / 14,
            ),
            child: buildView(context),
          ),
        ),
      ),
    );
  }

  Future<bool> onBackPressed({dynamic param}) {
    return _onWillPop();
  }

  Future<bool> _onWillPop({dynamic param}) {
    if (Navigator.canPop(context)) {
      if (param != null) {
        Navigator.pop(context, param);
        return Future.value(false);
      } else {
        Navigator.pop(context);
        return Future.value(false);
      }
    }
    return Future.value(true);
  }

  Color scaffoldBackgroundColor() {
    return Theme.of(context).scaffoldBackgroundColor;
  }

  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? floatingActionButton() {
    return null;
  }

  FloatingActionButtonLocation? floatingActionButtonLocation() {
    return null;
  }

  bool extendBodyBehindAppBar() {
    return false;
  }

  bool getResizeToAvoidBottomInset() {
    return true;
  }

  bool extendBody() {
    return false;
  }

  Widget buildView(BuildContext context);
}
