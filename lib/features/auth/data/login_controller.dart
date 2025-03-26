import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/features/auth/data/login_repo.dart';

class LoginController {
  LoginRepo fb;

  LoginController({required this.fb});

  Stream<User?> authChanged() => fb.authChanged();
  Future<String?> register(String email, String password) =>
      fb.register(email, password);
  Future<String?> login(String email, String password) =>
      fb.login(email, password);
  Future<void> logout() => fb.logout();
}
