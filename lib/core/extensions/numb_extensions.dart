import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension IntExtension on int {
  Widget get height => SizedBox(height: toDouble());

  Widget get width => SizedBox(width: toDouble());
}

extension NumbExtensions on num {
  String get toCurrency => NumberFormat.currency(
          decimalDigits: 2,
          symbol: NumberFormat.simpleCurrency().currencySymbol)
      .format(this)
      .toString();
}
