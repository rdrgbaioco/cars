import 'dart:isolate';

import 'package:cars/src/core/domain/entities/lead.dart';
import 'package:cars/src/core/domain/entities/user.dart';
import 'package:cars/src/core/domain/models/car.dart';
import 'package:cars/src/infra/api/app_repository.dart';
import 'package:cars/src/infra/api/app_repository_impl.dart';
import 'package:cars/src/infra/database/database.dart';
import 'package:http/http.dart';
import 'package:mobx/mobx.dart';

part 'cars_store.g.dart';


class CarsStore extends _CarsStore with _$CarsStore {
  CarsStore() : super(Database(), AppRepositoryImpl(client: Client()));
}

abstract class _CarsStore with Store {
  _CarsStore(this.database, this.repository) {
    initialize().ignore();
    sincronizarLeads().ignore();
  }

  final Database database;
  final AppRepository repository;

  @observable
  User user = User.empty();

  @observable
  List<Car> cars = [];

  @action
  Future<void> initialize() async {
    final user = await database.getUser();
    if (user != null) {
      this.user = user;
    }
    final cars = await repository.getAllCars();
    this.cars = cars;
  }

  @action
  Future<void> saveLead(Car car) async {
    final lead = Lead(
      modeloId: car.modeloId,
      userEmail: user.email,
      timestamp: DateTime.now(),
    );

    await database.saveLead(lead);
  }

  @observable
  bool running = true;

  @action
  void stopRunning() {
    running = false;
  }

  Future<void> sincronizarLeads() async {
    while (running) {
      final leads = await database.getAllLeads();
      if (leads.isNotEmpty) {
        await repository.sendLead(leads);
        await database.deleteAllLeads();
      }

      await Future.delayed(const Duration(seconds: 15));
    }
  }
}