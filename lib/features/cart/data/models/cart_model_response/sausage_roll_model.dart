import 'package:flutter/foundation.dart';
import 'package:sausage_roll/features/cart/domain/entities/sausage_roll_entity.dart';

class SausageRollModel extends SausageRollEntity {
  SausageRollModel({
    super.id,
    required super.articleCode,
    required super.shopCode,
    required super.availableFrom,
    required super.availableUntil,
    required super.eatOutPrice,
    required super.eatInPrice,
    required super.articleName,
    required super.dayParts,
    required super.internalDescription,
    required super.customerDescription,
    required super.imageUri,
    required super.thumbnailUri,
  });

  factory SausageRollModel.fromJson(Map<String, dynamic> json) {
    return SausageRollModel(
        id: json['id'],
        articleCode: json['articleCode'],
        shopCode: json['shopCode'],
        availableFrom: json['availableFrom'],
        availableUntil: json['availableUntil'],
        eatOutPrice: json['eatOutPrice'],
        eatInPrice: json['eatInPrice'],
        articleName: json['articleName'],
        dayParts: List<String>.from(json['dayParts']),
        internalDescription: json['internalDescription'],
        customerDescription: json['customerDescription'],
        imageUri: json['imageUri'],
        thumbnailUri: 'thumbnailUri');
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "articleCode": articleCode,
      "shopCode": shopCode,
      "availableFrom": availableFrom,
      "availableUntil": availableUntil,
      "eatOutPrice": eatOutPrice,
      "eatInPrice": eatInPrice,
      "articleName": articleName,
      "dayParts": dayParts,
      "internalDescription": internalDescription,
      "customerDescription": customerDescription,
      "imageUri": imageUri,
      "thumbnailUri": thumbnailUri
    };
  }
}
