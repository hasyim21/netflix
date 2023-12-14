part of 'user_bloc.dart';

enum UserStatus {
  initial,
  loading,
  success,
  error,
}

class UserState extends Equatable {
  final User user;
  final UserStatus status;
  final String error;

  const UserState({
    required this.user,
    required this.status,
    required this.error,
  });

  factory UserState.initial() {
    return UserState(
      user: User.initial(),
      status: UserStatus.initial,
      error: '',
    );
  }

  UserState copyWith({
    User? user,
    UserStatus? status,
    String? error,
  }) {
    return UserState(
      user: user ?? this.user,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [user, status, error];

  @override
  String toString() => 'UserState(user: $user, status: $status, error: $error)';
}
