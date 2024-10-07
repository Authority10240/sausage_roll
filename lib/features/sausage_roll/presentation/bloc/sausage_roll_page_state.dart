part of 'sausage_roll_page_bloc.dart';

@immutable
abstract class SausageRollPageState extends BaseState {
  SausageRollPageState({super.errorCode, super.errorMessage});
}

class SausageRollPageInitState extends SausageRollPageState {}

class SausageRollGetAllSausagesState extends SausageRollPageState {
  SausageRollGetAllSausagesState(
      {super.errorCode,
      super.errorMessage,
      this.sausages,
      this.eattInAmount,
      this.eatOutAmount});

  List<SausageRollEntity>? sausages;
  num? eattInAmount;
  num? eatOutAmount;
}
