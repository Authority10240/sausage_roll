import 'dart:io';

String testData(String fileName) =>
    File('test/test_data/$fileName').readAsStringSync();
