import 'package:flutter/material.dart';
import 'package:sausage_roll/core/locator.dart';
import 'package:sausage_roll/generated/l10n.dart';
import 'base_bloc.dart';
import 'base_state.dart';

abstract class BaseWidget extends StatefulWidget {
  const BaseWidget({Key? key}) : super(key: key);
}

abstract class BaseWidgetState<T extends BaseWidget, B extends BaseBloc>
    extends State<T> {
  late B baseBloc;

  late S appLocalizations;

  @mustCallSuper
  void onBlocStateChanged(BaseBlocPrimaryState state) => state.call(context);

  @override
  void initState() {
    baseBloc = initBloc();
    appLocalizations = locator<S>();
    baseBloc.baseState?.listen(onBlocStateChanged);
    super.initState();
  }

  B getBloc() => baseBloc;

  B initBloc();

  S getLocalization() => appLocalizations;

  @override
  void dispose() {
    getBloc().dispose();
    super.dispose();
  }
}
