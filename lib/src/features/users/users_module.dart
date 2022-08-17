import 'package:consumestore/src/features/users/views/get_user_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/users_controller.dart';
import 'views/get_users_view.dart';

class UsersModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => UsersController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/all', child: (context, args) => const GetUsersView()),
        ChildRoute(
          '/:user',
          child: (context, args) => GetUserView(user: args.params['user']),
        ),
      ];
}
