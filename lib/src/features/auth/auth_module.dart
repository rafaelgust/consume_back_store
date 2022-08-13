import 'package:flutter_modular/flutter_modular.dart';

import 'views/login_view.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/login', child: (context, args) => const LoginView()),
      ];
}
