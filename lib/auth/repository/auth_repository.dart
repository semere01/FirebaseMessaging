import 'package:meta/meta.dart';

import '../auth.dart';

class AuthRepository {
  final AuthDataProvider dataProvider;

  AuthRepository({required this.dataProvider}) : assert(dataProvider != null);

  Future<void> createUser(String username, String password) async {
    await dataProvider.createUser(username, password);
  }

  Future<void> authenticateUser(username, password) async {
    await dataProvider.authenticateUser(username, password);
  }

}
