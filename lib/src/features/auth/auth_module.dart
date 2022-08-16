import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/auth_controller.dart';
import 'views/login_view.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds =>
      [Bind.singleton<AuthController>((i) => AuthController(i()))];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/login', child: (context, args) => const LoginView()),
      ];
}
