import 'dart:io';

import 'package:flutter/services.dart';

Future<String> jsonData(String fileName) async {
  return await rootBundle.loadString('lib/test_data/sausage_roll.json');
}
