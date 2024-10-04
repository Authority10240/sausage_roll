import 'package:equatable/equatable.dart';

class BaseSideEffect extends Equatable {
  const BaseSideEffect({this.properties = const []});

  final List properties;

  String getEventName() {
    return '';
  }

  @override
  List<Object?> get props => properties;
}
