import 'package:dio/dio.dart';

import '../../constant/constant.dart';
import '../models/token/request_token.dart';

class AuthService {
  final Dio _dio = Dio();

  Future<String> getToken() async {
    var response = await _dio.get(
      "$baseUrl/authentication/token/new",
      options: Options(
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $tokenAuth",
        },
      ),
    );
    Map<String, dynamic> token = response.data;
    String requestToken = token["request_token"];
    return requestToken;
  }

  Future<Token> loginUser({
    required String username,
    required String password,
    required String token,
  }) async {
    var response = await _dio.post(
      "$baseUrl/authentication/token/validate_with_login",
      options: Options(
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $tokenAuth",
        },
      ),
      data: {
        "username": username,
        "password": password,
        "request_token": token,
      },
    );
    Token result = Token.fromJson(response.data);
    return result;
  }
}
