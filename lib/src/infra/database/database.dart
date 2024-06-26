import 'dart:async';

import 'package:cars/src/core/domain/entities/lead.dart';
import 'package:cars/src/core/domain/entities/user.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

/// Isar Database.
class Database {
  // Construtor Singleton, para garantir que tenhamos apenas uma instância.
  // Caso não tenhamos, iremos criar uma nova instancia.
  factory Database() {
    _instance ??= const Database._();
    return _instance!;
  }

  // Construtor privado (para que possamos apenas acessar o singleton
  // pelo construtor padrao)
  const Database._();

  // Instancia do Isar
  static Database? _instance;

  static Isar? get _isar => Isar.getInstance('database');

  static Future<Isar> initialize() async {
    final directory = await getApplicationDocumentsDirectory();
    if (_isar == null) {
      return Isar.open(
        [LeadSchema, UserSchema],
        directory: directory.path,
        name: 'database',
        inspector: true,
      );
    }

    return _isar!;
  }

  Future<List<Lead>> getAllLeads() async {
    final leads = await _isar?.leads
        .where()
        .findAll();
    if (leads == null) {
      return [];
    }

    return leads;
  }

  Future<void> saveLead(Lead lead) async {
    await _isar?.writeTxn(() async {
      await _isar?.leads.put(lead);
    });
  }

  Future<void> deleteLead(int id) async {
    await _isar?.writeTxn(() async {
      await _isar?.leads.delete(id);
    });
  }

  Future<void> deleteAllLeads() async {
    await _isar?.writeTxn(() async {
      await _isar?.leads.clear();
    });
  }

  Future<User?> getUser() async {
    final user = await _isar?.users
        .where()
        .findFirst();
    return user;
  }

  Future<void> saveUser(User user) async {
    final x = await _isar?.writeTxn(() async {
      await _isar?.users.put(user);
    });
    print(x);
  }

  Future<void> deleteUser() async {
    await _isar?.writeTxn(() async {
      await _isar?.users.clear();
    });
  }
}