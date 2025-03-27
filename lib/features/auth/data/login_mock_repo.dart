import 'dart:async';

import 'package:todo_app/features/auth/data/login_repo.dart';
import 'package:todo_app/features/auth/models/user_data.dart';

class LoginMockRepo implements LoginRepo {
  final List<UserData> users = [];

  StreamController<UserData?> streamController = StreamController<UserData?>();

  @override
  Stream<dynamic> onAuthChanged() {
    return streamController.stream;
  }

  @override
  Future<void> logout() async {
    streamController.add(null);
  }

  @override
  Future<String?> login(String email, String password) async {
    for (final user in users) {
      if (user.email == email) {
        if (user.password == password) {
          streamController.add(user);
          return null;
        } else {
          return "Passwort stimmt nicht überein";
        }
      }
    }
    return "falsche login daten";
  }

  @override
  Future<String?> register(String email, String password) async {
    for (final user in users) {
      if (user.email == email) {
        return "Benutzer existiert bereits";
      }
    }
    final newUser = UserData(email, password, "UID-${users.length}");
    users.add(newUser);
    streamController.add(newUser);

    return null;
  }

  @override
  Future<String?> signInWithGoogle() async {
    // Hardcoded Google-Account
    String googleTestEmail = "test@google.com";
    UserData? foundUser;
    for (final user in users) {
      if (user.email == googleTestEmail) {
        foundUser = user;
      }
    }

    if (foundUser == null) {
      foundUser = UserData(
        googleTestEmail,
        googleTestEmail,
        "UID-${users.length + 1}",
      );
      users.add(foundUser);
    }
    streamController.add(foundUser);
    return null;
  }
}
