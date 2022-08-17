import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/auth_controller.dart';
import '../exceptions/auth_exception.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = Modular.get<AuthController>();

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

  void _errorSnack(String text) {
    final snackBar = SnackBar(content: Text(text), backgroundColor: Colors.red);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _login() {
    final validate = controller.credentials.validate();
    if (validate == null) {
      controller.login().catchError((e) {
        var error = e as AuthException;
        _errorSnack(error.message);
      });
    } else {
      _errorSnack(validate);
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
              onChanged: controller.credentials.setEmail,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => controller.credentials.email.validate(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: TextFormField(
              onChanged: controller.credentials.setPassword,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => controller.credentials.password.validate(),
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
