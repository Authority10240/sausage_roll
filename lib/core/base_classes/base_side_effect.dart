import 'package:equatable/equatable.dart';
import 'package:sausage_roll/core/base_classes/base_state.dart';

class BaseSideEffect extends Equatable {
  BaseSideEffect(
      {this.dataState = DataState.init,
      this.errorCode,
      this.errorMessage,
      this.properties = const []});

  final List properties;
  final String? errorCode;
  final String? errorMessage;
  late DataState dataState;

  String getEventName() {
    return '';
  }

  @override
  List<Object?> get props => properties;
}
