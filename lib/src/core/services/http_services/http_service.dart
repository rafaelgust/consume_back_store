abstract class HttpService {
  Future<dynamic> fetchGet(String url);
  Future<dynamic> tokenBasic({required String url, required String token});
}
