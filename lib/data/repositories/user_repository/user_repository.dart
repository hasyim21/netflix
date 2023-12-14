import 'package:netflix/data/models/user/user.dart';

import '../../services/user_service.dart';
import 'user_repository_provider.dart';

class UserRepository implements UserRepositoryProvider {
  UserService userService;

  UserRepository({required this.userService});

  @override
  Future<User> getUser() async {
    try {
      final User user = await userService.getUser();
      return user;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
