import 'package:sausage_roll/core/base_classes/base_bloc.dart';
import 'package:sausage_roll/core/base_classes/base_event.dart';
import 'package:sausage_roll/core/base_classes/base_state.dart';
import 'package:sausage_roll/features/sausage_roll_page/presentation/bloc/sausasge_roll_page_side_effect.dart';

import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sausage_roll_page_event.dart';
part 'sausage_roll_page_state.dart';

@injectable
class SausageRollBloc extends BaseBloc<SausageRollPageEvent,
    SausageRollPageState, SausageRollPageSideEffect> {
  SausageRollBloc() : super(SausageRollPageInitState()) {}
}
