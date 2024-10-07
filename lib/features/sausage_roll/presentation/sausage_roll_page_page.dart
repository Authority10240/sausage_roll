import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sausage_roll/core/base_classes/base_page.dart';
import 'package:sausage_roll/core/locator.dart';
import 'package:sausage_roll/features/sausage_roll/presentation/bloc/sausage_roll_page_bloc.dart';
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
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  appLocalizations.yourCart,
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 79, 71, 155),
                    Color.fromARGB(255, 43, 40, 73),
                  ]),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    //topRight: Radius.circular(40)
                  ),
                ),
              ))
            ],
          ),
        );
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
