import 'package:netflix/data/models/token/request_token.dart';

import '../../services/db_service.dart';
import '../../services/auth_service.dart';
import 'auth_repository_provider.dart';

class AuthRepository implements AuthRepositoryProvider {
  final AuthService authService;
  final DbService dbService;

  AuthRepository({required this.authService, required this.dbService});

  @override
  Future<String> getToken() async {
    try {
      final String requestToken = await authService.getToken();

      return requestToken;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  @override
  Future<Token> loginUser({
    required String username,
    required String password,
    required String token,
  }) async {
    try {
      final Token result = await authService.loginUser(
        username: username,
        password: password,
        token: token,
      );

      return result;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  @override
  Future<bool> hasToken() async {
    bool value = await dbService.hasToken();
    return value;
  }

  @override
  Future<void> deleteToken() async {
    await dbService.deleteToken();
  }

  @override
  Future<void> saveToken(String token) async {
    await dbService.saveToken(token);
  }

  @override
  Future<void> saveUser(Map<String, dynamic> user) async {
    await dbService.saveUser(user);
  }

  @override
  Future<Map<String, dynamic>?> getUser() async {
    final user = await dbService.getUser();
    return user;
  }
}
