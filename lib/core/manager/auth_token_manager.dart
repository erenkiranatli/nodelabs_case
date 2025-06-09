import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:nodelabs_case/main.dart';

class AuthTokenManager {
  final _storage = const FlutterSecureStorage();
  static const _tokenKey = 'auth_token';

  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    final token = await _storage.read(key: _tokenKey);
    logger.info("token:$token");
    if (token != null && isTokenExpired(token)) {
      logger.info("tokenExpired");
      await deleteToken();
      return null;
    }
    return token;
  }

  Future<void> deleteToken() async {
    logger.info("deleteToken");
    await _storage.delete(key: _tokenKey);
  }

  bool isTokenExpired(String token) {
    var isExpired = JwtDecoder.isExpired(token);
    return isExpired;
  }
}
