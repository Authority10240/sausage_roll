import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:sausage_roll/core/base_classes/base_side_effect.dart';
import 'dart:async';

import 'base_event.dart';
import 'base_state.dart';

abstract class BaseBloc<T extends BaseEvent, S extends BaseState,
        SE extends BaseSideEffect> extends Bloc<T, S>
    with BlocSideEffectMixin<T, S, SE> {
  final _stateController = StreamController<BaseBlocPrimaryState>();
  BaseBloc(S initialState) : super(initialState);

  Stream<BaseBlocPrimaryState>? get baseState => _stateController.stream;

  Sink<BaseBlocPrimaryState>? get sinkState {
    if (_stateController.isClosed) return null;
    return _stateController.sink;
  }

  @mustCallSuper
  dispose() {
    _stateController.close();
  }
}
