import 'package:app_delivery/app/models/auth_model.dart';

abstract class AuthRepository {
  Future<void> register(String name, String password, String email);

  Future<AuthModel> login(String email, String password);
}
