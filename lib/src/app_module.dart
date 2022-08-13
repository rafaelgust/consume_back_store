import 'package:flutter_modular/flutter_modular.dart';

import 'core/core_module.dart';

import 'features/auth/auth_module.dart';
import 'features/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ModuleRoute('/auth', module: AuthModule()),
        /* WildcardRoute(child: (context, args) => const NotFoundPage()), */
      ];
}
