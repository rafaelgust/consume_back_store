import 'package:dio/dio.dart';

import 'http_service.dart';

class HttpServiceDio implements HttpService {
  var dio = Dio();
  final urlBase = 'http://192.168.139.1:3000';

  @override
  Future<dynamic> fetchGet(url) async {
    final response = await dio.get(url);
    return response;
  }

  @override
  Future<dynamic> tokenBasic({
    required String url,
    required String token,
  }) async {
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] = "basic $token";
    try {
      final response = await dio.get('$urlBase$url');
      return response.data;
    } on DioError catch (e) {
      String? statusCode = e.response?.statusCode.toString();
      throw Exception([statusCode]);
    }
  }

  @override
  Future refreshToken(String refreshToken) async {
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] = "bearer $refreshToken";
    try {
      final response = await dio.get('$urlBase/auth/refresh_token');
      return response.data;
    } on DioError catch (e) {
      String? statusCode = e.response?.statusCode.toString();
      throw Exception([statusCode]);
    }
  }
}
