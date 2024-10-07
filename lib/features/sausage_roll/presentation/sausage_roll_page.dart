import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sausage_roll/core/base_classes/base_page.dart';
import 'package:sausage_roll/core/base_classes/base_state.dart';
import 'package:sausage_roll/core/extensions/numb_extensions.dart';
import 'package:sausage_roll/core/locator.dart';
import 'package:sausage_roll/core/widgets/preloader_widget.dart';
import 'package:sausage_roll/features/cart/presentation/cart_page.dart';
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
    super.initState();
    getBloc().add(SausageRollGetAllSausagesEvent());
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
        return state is SausageRollGetAllSausagesState &&
                state.dataState == DataState.loading
            ? preloaderWidget()
            : state is SausageRollGetAllSausagesState &&
                    state.dataState == DataState.success
                ? Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            appLocalizations.yourCart,
                            style: TextStyle(
                                fontSize: 36, fontWeight: FontWeight.bold),
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
                                child: Container(
                                  child: ListView.builder(
                                      itemCount: state.sausages?.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          leading: CachedNetworkImage(
                                              imageUrl: state.sausages!
                                                  .elementAt(index)
                                                  .imageUri),
                                          title: Text(
                                            state.sausages!
                                                .elementAt(index)
                                                .articleName,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 24),
                                          ),
                                          subtitle: Text(
                                            state.sausages!
                                                .elementAt(index)
                                                .eatInPrice
                                                .toCurrency,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                          trailing: const Icon(
                                            Icons.delete,
                                            size: 26,
                                            color: Colors.white,
                                          ),
                                        );
                                      }),
                                ))),
                      ],
                    ),
                  )
                : state is SausageRollGetAllSausagesState &&
                        state.dataState == DataState.error
                    ? Text(state.errorMessage!)
                    : SizedBox();
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
