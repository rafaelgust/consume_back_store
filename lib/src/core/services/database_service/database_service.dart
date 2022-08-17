import 'package:shared_preferences/shared_preferences.dart';

abstract class DataBaseService {
  Future<bool> saveAccessToken(String token);
  Future<bool> saveRefreshToken(String token);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> removeTokens();
}

class DataBaseServiceImpSharedPreferences implements DataBaseService {
  @override
  Future<bool> saveAccessToken(String token) async {
    final db = await SharedPreferences.getInstance();
    return await db.setString('accessToken', token);
  }

  @override
  Future<bool> saveRefreshToken(String token) async {
    final db = await SharedPreferences.getInstance();
    return await db.setString('refreshToken', token);
  }

  @override
  Future<String?> getAccessToken() async {
    final db = await SharedPreferences.getInstance();
    final String? accessToken = db.getString('accessToken');
    return accessToken;
  }

  @override
  Future<String?> getRefreshToken() async {
    final db = await SharedPreferences.getInstance();
    final String? refreshToken = db.getString('refreshToken');
    return refreshToken;
  }

  @override
  Future<void> removeTokens() async {
    final db = await SharedPreferences.getInstance();
    await db.remove('accessToken');
    await db.remove('refreshToken');
  }
}
