import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/features/auth/data/login_repo.dart';

class LoginFirebase implements LoginRepo {
  final FirebaseAuth _auth;

  LoginFirebase(this._auth);

  @override
  Stream<User?> authChanged() {
    return _auth.authStateChanges();
  }

  @override
  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-credentials':
          return "Falsche Anmeldedaten";
        default:
          return "EIn Fehler ist aufgetreten ";
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
          return 'E-Mail ist bereits vergeben';
        default:
          return "Ein Fehler ist aufgetreten";
      }
    }
    return null;
  }
}
