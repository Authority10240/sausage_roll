part of 'sausage_roll_page_bloc.dart';

@immutable
abstract class SausageRollPageState extends BaseState {
  SausageRollPageState(
      {this.amount,
      this.sausages,
      super.errorCode,
      super.errorMessage,
      this.eatIn = false});

  List<SausageRollEntity>? sausages;
  num? eattInAmount;
  num? amount;
  bool? eatIn;
}

class SausageRollPageInitState extends SausageRollPageState {}

class SausageRollGetAllSausagesState extends SausageRollPageState {
  SausageRollGetAllSausagesState(
      {super.errorCode,
      super.errorMessage,
      super.sausages,
      super.amount,
      super.eatIn});
}

class SausageRollChangeArrangementState extends SausageRollPageState {
  SausageRollChangeArrangementState(
      {super.errorCode,
      super.errorMessage,
      super.sausages,
      super.amount,
      super.eatIn});
}
