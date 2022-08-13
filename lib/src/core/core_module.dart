import 'package:flutter_modular/flutter_modular.dart';

import 'services/http_services/http_service.dart';
import 'services/http_services/http_dio_imp.dart';

class CoreModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory<HttpService>((i) => HttpServiceDio(), export: true),
      ];
}
