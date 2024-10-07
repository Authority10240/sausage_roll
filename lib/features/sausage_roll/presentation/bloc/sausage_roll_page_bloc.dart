import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:sausage_roll/core/base_classes/base_bloc.dart';
import 'package:sausage_roll/core/base_classes/base_event.dart';
import 'package:sausage_roll/core/base_classes/base_state.dart';
import 'package:sausage_roll/core/failures/base_failure.dart';
import 'package:sausage_roll/features/sausage_roll/domain/entities/sausage_roll_entity.dart';
import 'package:sausage_roll/features/sausage_roll/domain/use_cases/sausage_roll_usecase/sausage_roll_get_all_sausages_usecase.dart';
import 'package:sausage_roll/features/sausage_roll/presentation/bloc/sausasge_roll_page_side_effect.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sausage_roll_page_event.dart';
part 'sausage_roll_page_state.dart';

@injectable
class SausageRollBloc extends BaseBloc<SausageRollPageEvent,
    SausageRollPageState, SausageRollPageSideEffect> {
  SausageRollBloc({required this.sausageRollGetAllSausagesUseCase})
      : super(SausageRollPageInitState()) {
    on<SausageRollGetAllSausagesEvent>(
        (event, emit) => _onSausageRollGetAllSausagesEvent(event, emit));
  }

  final SausageRollGetAllSausagesUseCase sausageRollGetAllSausagesUseCase;

  Future<void> _onSausageRollGetAllSausagesEvent(
      SausageRollGetAllSausagesEvent event,
      Emitter<SausageRollPageState> emit) async {
    emit(SausageRollGetAllSausagesState()..dataState = DataState.loading);
    Either<BaseFailure, List<SausageRollEntity>> result =
        await sausageRollGetAllSausagesUseCase.call();
    result.fold((error) {
      emit(SausageRollGetAllSausagesState(
          errorCode: error.errorCode!, errorMessage: error.message!)
        ..dataState = DataState.error);
    }, (model) {
      num eatInTotalAmount = 0;
      num eatOutTotalAmount = 0;
      model.forEach((element) => eatInTotalAmount += element.eatInPrice);
      model.forEach((element) => eatOutTotalAmount += element.eatOutPrice);
      emit(SausageRollGetAllSausagesState(
          sausages: model,
          eatOutAmount: eatOutTotalAmount,
          eattInAmount: eatInTotalAmount));
    });
  }
}
