import 'package:equatable/equatable.dart';

class BaseEvent extends Equatable {
  const BaseEvent({this.properties = const []});

  final List properties;

  String getEventName() {
    return '';
  }

  @override
  List<Object?> get props => properties;
}
