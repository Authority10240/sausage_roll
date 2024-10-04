import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:sausage_roll/core/base_classes/base_bloc.dart';
import 'package:sausage_roll/core/base_classes/base_event.dart';
import 'package:sausage_roll/core/base_classes/base_state.dart';
import 'package:sausage_roll/features/bottom_navigation_page/presentation/bloc/bottom_navigation_page_side_effects.dart';

part 'bottom_navigation_page_event.dart';
part 'bottom_navigation_page_state.dart';

@injectable
class BottomNavigationPageBloc extends BaseBloc<BottomNavigationPagePageEvent,
    BottomNavigationPagePageState, BottomNavigationPagePageSideEffect> {
  BottomNavigationPageBloc() : super(BottomNavigationPagePageInitState()) {}
}
