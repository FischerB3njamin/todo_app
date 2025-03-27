import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/app.dart';
import 'package:todo_app/features/auth/data/login_controller.dart';
import 'package:todo_app/features/auth/data/login_firebase.dart';
import 'package:todo_app/features/auth/data/login_mock_repo.dart';
import 'package:todo_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth auth = FirebaseAuth.instance;
  LoginMockRepo mockRepo = LoginMockRepo();

  final loginRepository = LoginController(fb: LoginFirebase(auth));

  runApp(App(loginController: loginRepository));
}
