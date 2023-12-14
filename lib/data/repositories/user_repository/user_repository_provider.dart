import '../../models/user/user.dart';

abstract class UserRepositoryProvider {
  Future<User> getUser();
}
