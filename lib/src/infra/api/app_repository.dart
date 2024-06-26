import 'package:cars/src/core/domain/entities/lead.dart';
import 'package:cars/src/core/domain/models/car.dart';

abstract interface class AppRepository {
  Future<List<Car>> getAllCars();
  Future<void> sendLead(List<Lead> leads);
}