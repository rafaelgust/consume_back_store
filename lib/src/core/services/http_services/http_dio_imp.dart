import 'package:dio/dio.dart';

import 'http_service.dart';

class HttpServiceDio implements HttpService {
  var dio = Dio();

  @override
  Future<dynamic> fetchGet(url) async {
    final response = await dio.get(url);
    return response;
  }
}
