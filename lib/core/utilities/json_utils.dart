import 'dart:io';

String jsonData(String fileName) =>
    File('lib/test_data/$fileName').readAsStringSync();
