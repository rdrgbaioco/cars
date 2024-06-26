import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  const User({
    required this.name,
    required this.email,
    required this.password,
    this.id, // Ao usar null ativa o auto increment no Isar.
  });

  factory User.empty() => const User(
    name: '',
    email: '',
    password: '',
  );

  final Id? id;
  final String name;
  final String email;
  final String password;
}