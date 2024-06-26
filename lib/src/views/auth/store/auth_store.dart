import 'package:cars/src/core/domain/entities/user.dart';
import 'package:cars/src/infra/database/database.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore extends _AuthStore with _$AuthStore {
  AuthStore() : super(Database());
}

abstract class _AuthStore with Store {
  _AuthStore(this.database);

  final Database database;

  @observable
  bool isLoading = false;

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  Future<void> createUser(User user) async {
    setLoading(true);
    await database.saveUser(user);
    setLoading(false);
  }
}
