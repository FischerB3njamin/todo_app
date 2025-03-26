import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Willkommen zurück"),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "gebe eine Email ein ";
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    controller: emailController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Passwort",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "gebe ein Passwort ein ";
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 0,
                  children: [
                    Text('No Account? '),
                    TextButton(
                      onPressed: () {},
                      child: Text(" register now"),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Center(
                      child: Text("Login"),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
