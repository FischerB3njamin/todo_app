import 'package:flutter/material.dart';
import 'package:todo_app/features/auth/data/login_controller.dart';

class LoginScreen extends StatefulWidget {
  final LoginController loginController;
  const LoginScreen({
    super.key,
    required this.loginController,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? error;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget getLogin() {
    return getFooter(
      'No Account?',
      'register now',
      'Login',
      () => setState(() => isLogin = false),
      () async {
        if (formKey.currentState?.validate() ?? false) {
          error = await widget.loginController
              .login(emailController.text, passwordController.text);
          setState(() {});
        }
      },
    );
  }

  Widget getRegistration() {
    return getFooter(
      'Already registered?',
      'Login',
      'Register',
      () => setState(() => isLogin = true),
      () async {
        if (formKey.currentState?.validate() ?? false) {
          error = await widget.loginController
              .register(emailController.text, passwordController.text);
          setState(() {});
        }
      },
    );
  }

  Widget getFooter(
    String text1,
    String textButtonText,
    String buttonText,
    Function callbackTextButton,
    Function callback,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 0,
          children: [
            Text(text1),
            TextButton(
              onPressed: () => callbackTextButton(),
              child: Text(textButtonText),
            ),
          ],
        ),
        ElevatedButton(
            onPressed: () async => callback(),
            child: Center(
              child: Text(buttonText),
            ))
      ],
    );
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
            Text(
              isLogin ? "Welcome back" : "Welcome",
              style: TextTheme.of(context).headlineLarge,
            ),
            Form(
              key: formKey,
              child: Column(
                spacing: 16,
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter an Email";
                      }
                      String pattern =
                          r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b';
                      RegExp regex = RegExp(pattern);
                      if (!regex.hasMatch(value)) {
                        return 'Enter a vaild email';
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),
            if (error != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  error!,
                  style: TextTheme.of(context)
                      .bodyMedium!
                      .copyWith(color: Colors.redAccent),
                ),
              ),
            SizedBox(height: 16),
            if (isLogin) getLogin(),
            if (!isLogin) getRegistration(),
            SizedBox(height: 32),
            ElevatedButton(
                onPressed: () => widget.loginController.signInWithGoogle(),
                child: Text("login with google"))
          ],
        ),
      ),
    );
  }
}
