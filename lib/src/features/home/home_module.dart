import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/views/home_view.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomeView()),
      ];
}
