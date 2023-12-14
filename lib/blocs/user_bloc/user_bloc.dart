import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/user/user.dart';
import '../../data/repositories/user_repository/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserState.initial()) {
    on<GetUserEvent>((event, emit) async {
      emit(state.copyWith(status: UserStatus.loading));

      try {
        final User user = await userRepository.getUser();
        emit(state.copyWith(status: UserStatus.success, user: user));
      } catch (e) {
        emit(state.copyWith(status: UserStatus.error, error: e.toString()));
      }
    });
  }
}
