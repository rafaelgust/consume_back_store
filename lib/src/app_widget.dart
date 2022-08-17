import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'features/auth/controllers/auth_controller.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final controller = Modular.get<AuthController>();

  @override
  void initState() {
    super.initState();
    controller.addListener(_listener);
  }

  _listener() => setState(() {
        _page();
      });

  _page() {
    if (controller.state is Logged) {
      Modular.to.navigate('/');
    } else if (controller.state is Unlogged) {
      Modular.to.navigate('/auth/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/auth/login');
    return MaterialApp.router(
      title: 'Store - Consume BackEnd',
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
