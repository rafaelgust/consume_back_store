import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const FlutterLogo(),
          TextFormField(),
          TextFormField(),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.login),
            label: const Text('Entrar'),
          ),
        ],
      ),
    );
  }
}
