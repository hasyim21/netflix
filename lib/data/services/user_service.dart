import 'package:dio/dio.dart';

import '../../constant/constant.dart';
import '../models/user/user.dart';

class UserService {
  final Dio _dio = Dio();

  Future<User> getUser() async {
    try {
      final response = await _dio.get(
        "$baseUrl/account/$accountId",
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $tokenAuth",
          },
        ),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> result = response.data;
        return User.fromJson(result);
      } else {
        throw Exception("Failed get user. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error: $error");
    }
  }
}
