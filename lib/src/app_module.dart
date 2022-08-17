import 'package:flutter_modular/flutter_modular.dart';

import 'core/core_module.dart';

import 'features/auth/auth_module.dart';
import 'features/auth/guards/auth_guard.dart';

import 'features/home/home_module.dart';
import 'features/users/users_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
        AuthModule(),
      ];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ModuleRoute('/auth', module: AuthModule(), guards: [AuthGuard()]),
        ModuleRoute('/users', module: UsersModule()),
      ];
}
