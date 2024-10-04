import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sausage_roll/core/base_classes/base_page.dart';
import 'package:sausage_roll/core/locator.dart';
import 'package:sausage_roll/features/sausage_roll_page/presentation/bloc/sausage_roll_page_bloc.dart';
import 'package:sausage_roll/generated/l10n.dart';

class SausageRollPage extends BasePage {
  const SausageRollPage({super.key});

  @override
  _SausageRollPageState createState() => _SausageRollPageState();
}

class _SausageRollPageState
    extends BasePageState<SausageRollPage, SausageRollBloc> {
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
    return BlocConsumer<SausageRollBloc, SausageRollPageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container();
      },
    );
  }

  @override
  SausageRollBloc initBloc() {
    return locator<SausageRollBloc>();
  }

  @override
  S initLocalization() {
    return locator<S>();
  }
}
