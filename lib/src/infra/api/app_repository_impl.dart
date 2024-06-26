import 'dart:convert';

import 'package:cars/src/core/domain/entities/lead.dart';
import 'package:cars/src/core/domain/models/car.dart';
import 'package:cars/src/infra/api/app_repository.dart';
import 'package:http/http.dart';

class AppRepositoryImpl implements AppRepository {
  const AppRepositoryImpl({
    required this.client,
  });

  final Client client;

  @override
  Future<List<Car>> getAllCars() async {
    var client = Client();
    try {
      var uri = Uri.parse('https://wswork.com.br/cars.json');
      var response = await client.get(uri);
      var decodedResponse = jsonDecode(utf8
          .decode(response.bodyBytes)) as Map<String, dynamic>;

      final cars = decodedResponse['cars'] as List<dynamic>;
      final carsList = cars
        .map((car) => Car.fromMap(car as Map<String, dynamic>))
        .toList();

      return carsList;
    } on Exception catch (e) {
      return [];
    } finally {
      client.close();
    }
  }

  @override
  Future<void> sendLead(List<Lead> leads) async {
    var client = Client();
    try {
      var uri = Uri.parse('https://www.wswork.com.br/cars/leads');
      final json = leads.map((e) => e.toMap()).toList();
      await client.post(uri, body: jsonEncode(json));
    } finally {
      client.close();
    }
  }
}