import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/features/auth/data/login_repo.dart';

class LoginFirebase implements LoginRepo {
  final FirebaseAuth _auth;

  LoginFirebase(this._auth);

  @override
  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-credentials':
          return "Wrong logindata";
        default:
          return "An error Occured";
      }
    }
    return null;
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }

  @override
  Future<String?> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          return 'E-Mail already registered. Please login';
        default:
          return "An error Occured";
      }
    }
    return null;
  }

  @override
  get onAuthChanged => _auth.authStateChanges();
}
