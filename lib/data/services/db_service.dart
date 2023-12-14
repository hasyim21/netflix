import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DbService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> saveToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
  }

  Future<void> saveUser(Map<String, dynamic> user) async {
    await storage.write(key: 'user', value: jsonEncode(user));
  }

  Future<Map<String, dynamic>?> getUser() async {
    final userString = await storage.read(key: 'user');
    if (userString != null && userString.isNotEmpty) {
      final user = jsonDecode(userString) as Map<String, dynamic>;
      return user;
    }
    return null;
  }
}
