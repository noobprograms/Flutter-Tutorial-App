import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:tutorial_project/database_service.dart';
import 'package:tutorial_project/gradient_file.dart';
import 'package:tutorial_project/quiz.dart';
import 'package:tutorial_project/welcome_screen.dart';

void main() {
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
  }
  databaseFactory = databaseFactoryFfi;
  runApp(
    MaterialApp(
      home: Quiz(),
    ),
  );
}
