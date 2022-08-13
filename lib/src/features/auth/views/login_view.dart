import 'package:consumestore/src/core/services/auth_service/dto/login_credential.dart';

import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final credentials = LoginCredential();

  bool _visibilityPass = false;

  Icon _visibilityIcon = const Icon(Icons.visibility_off);

  void _changeVisiblityPass() {
    setState(() {
      _visibilityPass = !_visibilityPass;
      _visibilityPass
          ? _visibilityIcon = const Icon(Icons.visibility)
          : _visibilityIcon = const Icon(Icons.visibility_off);
    });
  }

  void _login() {
    final validate = credentials.validate();
    if (validate == null) {
    } else {
      final snackBar = SnackBar(
        content: Text(validate),
        backgroundColor: Colors.red,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const FlutterLogo(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: TextFormField(
              onChanged: credentials.setEmail,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => credentials.email.validate(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: TextFormField(
              onChanged: credentials.setPassword,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => credentials.password.validate(),
              obscureText: _visibilityPass,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Password',
                suffixIcon: IconButton(
                  onPressed: _changeVisiblityPass,
                  icon: _visibilityIcon,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: _login,
            icon: const Icon(Icons.login),
            label: const Text('Entrar'),
          ),
        ],
      ),
    );
  }
}
