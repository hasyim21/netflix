import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/token/request_token.dart';
import '../../data/repositories/auth_repository/auth_repository.dart';
import '../auth_bloc/auth_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  final AuthBloc authBloc;

  LoginBloc({required this.authRepository, required this.authBloc})
      : super(LoginInitial()) {
    on<DoLogin>((event, emit) async {
      emit(LoginLoading());
      try {
        final String token = await authRepository.getToken();
        final Token result = await authRepository.loginUser(
          username: event.username,
          password: event.password,
          token: token,
        );

        authBloc.add(LoggedIn(
          token: result.requestToken!,
          user: {
            'username': event.username,
            'password': event.password,
          },
        ));
        emit(LoginInitial());
      } catch (error) {
        emit(LoginFailure(error: error.toString()));
      }
    });
  }
}
