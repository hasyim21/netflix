import '../../models/token/request_token.dart';

abstract class AuthRepositoryProvider {
  Future<String> getToken();
  Future<Token> loginUser({
    required String username,
    required String password,
    required String token,
  });
  Future<bool> hasToken();
  Future<void> saveToken(String token);
  Future<void> deleteToken();
  Future<void> saveUser(Map<String, dynamic> user);
  Future<Map<String, dynamic>?> getUser();
}
