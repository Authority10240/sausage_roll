import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BaseState extends Equatable {
  late DataState dataState;
  final String? errorMessage;
  final String? errorCode;

  BaseState(
      {this.dataState = DataState.init, this.errorMessage, this.errorCode});

  @override
  // TODO: implement props
  List<Object?> get props => [dataState];
}

enum DataState { init, loading, reloading, success, error }

abstract class BaseBlocPrimaryState {
  void call(BuildContext context);
}
