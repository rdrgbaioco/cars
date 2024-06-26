// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cars_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CarsStore on _CarsStore, Store {
  late final _$userAtom = Atom(name: '_CarsStore.user', context: context);

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$carsAtom = Atom(name: '_CarsStore.cars', context: context);

  @override
  List<Car> get cars {
    _$carsAtom.reportRead();
    return super.cars;
  }

  @override
  set cars(List<Car> value) {
    _$carsAtom.reportWrite(value, super.cars, () {
      super.cars = value;
    });
  }

  late final _$runningAtom = Atom(name: '_CarsStore.running', context: context);

  @override
  bool get running {
    _$runningAtom.reportRead();
    return super.running;
  }

  @override
  set running(bool value) {
    _$runningAtom.reportWrite(value, super.running, () {
      super.running = value;
    });
  }

  late final _$initializeAsyncAction =
      AsyncAction('_CarsStore.initialize', context: context);

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  late final _$saveLeadAsyncAction =
      AsyncAction('_CarsStore.saveLead', context: context);

  @override
  Future<void> saveLead(Car car) {
    return _$saveLeadAsyncAction.run(() => super.saveLead(car));
  }

  late final _$_CarsStoreActionController =
      ActionController(name: '_CarsStore', context: context);

  @override
  void stopRunning() {
    final _$actionInfo = _$_CarsStoreActionController.startAction(
        name: '_CarsStore.stopRunning');
    try {
      return super.stopRunning();
    } finally {
      _$_CarsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
cars: ${cars},
running: ${running}
    ''';
  }
}
