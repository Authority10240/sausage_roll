import 'package:equatable/equatable.dart';

class SausageRollEntity extends Equatable {
  int? id;
  final String articleCode;
  final String shopCode;
  final String availableFrom;
  final String availableUntil;
  final num eatOutPrice;
  final num eatInPrice;
  final String articleName;
  final List<String> dayParts;
  final String internalDescription;
  final String customerDescription;
  final String imageUri;
  final String thumbnailUri;

  SausageRollEntity(
      {this.id,
      required this.articleCode,
      required this.shopCode,
      required this.availableFrom,
      required this.availableUntil,
      required this.eatOutPrice,
      required this.eatInPrice,
      required this.articleName,
      required this.dayParts,
      required this.internalDescription,
      required this.customerDescription,
      required this.imageUri,
      required this.thumbnailUri});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
