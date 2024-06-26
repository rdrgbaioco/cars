import 'package:cars/src/route/app_routes.dart';
import 'package:flutter/material.dart';

class CarsApp extends StatelessWidget {
  const CarsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Desafio Mobile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          surface: const Color(0xFF515394),
          seedColor: const Color(0xFFF0BD04),
        ),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
