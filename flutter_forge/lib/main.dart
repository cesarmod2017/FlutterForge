import 'package:flutter/material.dart';
import 'package:flutter_forge/app/my_app.dart';
import 'package:flutter_forge/app/service/storage_service.dart';
import 'package:flutter_forge/config/databases/database_init.dart';
import 'package:flutter_forge/config/dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();
  await Future.wait([
    SqfLiteHub.init(),
    initialConfig(),
  ]);
  runApp(const MyAppMain());
}
