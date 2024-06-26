// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cars/src/infra/api/app_repository.dart';
import 'package:cars/src/infra/api/app_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart';

Future<void> main() async {
  late final Client client;
  late final AppRepository repository;

  group('Teste de API e Endpoint', () {
    setUpAll(() {
      client = Client();
      repository = AppRepositoryImpl(client: client);
    });

    test('Verificar quantidade de carros', () async {
      final cars = await repository.getAllCars();
      expect(cars.length, 3);
    });
  });
}
