import 'package:cars/app.dart';
import 'package:cars/src/infra/database/database.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Carrega a instancia e esquemas do Isar
  await Database.initialize();

  runApp(const CarsApp());
}