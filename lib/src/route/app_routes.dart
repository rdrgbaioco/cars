import 'package:cars/src/infra/database/database.dart';
import 'package:cars/src/views/auth/auth_page.dart';
import 'package:cars/src/views/auth/store/auth_store.dart';
import 'package:cars/src/views/cars/cars_page.dart';
import 'package:cars/src/views/cars/store/cars_store.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => CarsPage(
        store: CarsStore(),
      ),
      redirect: (context, state) async {
        if (state.path == '/') {
          final db = Database();
          final user = await db.getUser();
          if (user != null) {
            return '/';
          } else {
            return '/auth';
          }
        }

        return state.matchedLocation;
      },
      routes: [
        GoRoute(
          path: 'home',
          builder: (context, state) => Container(),
        ),

      ],
    ),
    GoRoute(
      path: '/auth',
      name: 'auth',
      builder: (context, state) => AuthPage(
        store: AuthStore(),
      ),
    ),
  ],
);