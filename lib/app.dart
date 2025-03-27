import 'package:flutter/material.dart';
import 'package:todo_app/features/auth/data/login_controller.dart';
import 'package:todo_app/features/auth/views/login_screen.dart';
import 'package:todo_app/features/categories/view/category_page.dart';

class App extends StatelessWidget {
  final LoginController loginController;
  const App({
    super.key,
    required this.loginController,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
          stream: loginController.onAuthChanged(),
          builder: (context, snapshot) {
            /// User ist authentifiziert
            if (snapshot.hasData && snapshot.data != null) {
              final user = snapshot.data!;
              return CategoryPage(loginController: loginController, user: user);
            }
            return LoginScreen(loginController: loginController);
          }),
    );
  }
}
