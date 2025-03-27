import 'package:todo_app/features/auth/data/login_repo.dart';

class LoginController {
  LoginRepo fb;

  LoginController({required this.fb});

  get onAuthChanged => fb.onAuthChanged;

  Future<String?> register(String email, String password) =>
      fb.register(email, password);
  Future<String?> login(String email, String password) =>
      fb.login(email, password);
  Future<void> logout() => fb.logout();
  Future<String?> signInWithGoogle() => fb.signInWithGoogle();
}
