import 'dart:io';

String fixture(String pathToFile) =>
    File('test/fixtures/$pathToFile').readAsStringSync();
