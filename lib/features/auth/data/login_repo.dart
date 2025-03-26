abstract class LoginRepo {
  get onAuthChanged => null;

  Future<String?> register(String email, String password);
  Future<String?> login(String email, String password);
  Future<void> logout();
}
