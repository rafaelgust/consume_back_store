import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => Modular.to.navigate('/auth/login'),
              child: const Text('Login'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => Modular.to.navigate('/users/all'),
              child: const Text('Users'),
            ),
          ),
        ],
      ),
    );
  }
}
