part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class DoLogin extends LoginEvent {
  final String username;
  final String password;

  const DoLogin({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];

  @override
  String toString() => 'DoLogin(username: $username, password: $password)';
}
