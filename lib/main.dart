import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'blocs/auth_bloc/auth_bloc.dart';
import 'blocs/detail_movie_bloc/detail_movie_bloc.dart';
import 'blocs/genre_movie_bloc/genre_movie_bloc.dart';
import 'blocs/login_bloc/login_bloc.dart';
import 'blocs/movie_bloc/movie_bloc.dart';
import 'blocs/user_bloc/user_bloc.dart';
import 'blocs/video_movie_bloc/video_movie_bloc.dart';
import 'data/services/db_service.dart';
import 'data/repositories/auth_repository/auth_repository.dart';
import 'data/repositories/detail_movie_repository/detail_movie_repository.dart';
import 'data/repositories/genre_movie_repository/genre_movie_repository.dart';
import 'data/repositories/movie_repository/movie_repository.dart';
import 'data/repositories/user_repository/user_repository.dart';
import 'data/repositories/video_movie_repository/video_movie_repository.dart';
import 'data/services/auth_service.dart';
import 'data/services/detail_movie_service.dart';
import 'data/services/genre_service.dart';
import 'data/services/movie_service.dart';
import 'data/services/user_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(
            authService: AuthService(),
            dbService: DbService(),
          ),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(
            userService: UserService(),
          ),
        ),
        RepositoryProvider(
          create: (context) => MovieRepository(
            movieService: MovieService(),
          ),
        ),
        RepositoryProvider(
          create: (context) => DetailMovieRepository(
            detailMovieService: DetailMovieService(),
          ),
        ),
        RepositoryProvider(
          create: (context) => GenreMovieRepository(
            genreMovieService: GenreMovieService(),
          ),
        ),
        RepositoryProvider(
          create: (context) => VideoMovieRepository(
            videoMovieService: DetailMovieService(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            )..add(AppStarted()),
          ),
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(
              authRepository: context.read<AuthRepository>(),
              authBloc: context.read<AuthBloc>(),
            ),
          ),
          BlocProvider<UserBloc>(
            create: (context) => UserBloc(
              userRepository: context.read<UserRepository>(),
            ),
          ),
          BlocProvider<MovieBloc>(
            create: (context) => MovieBloc(
              movieRepository: context.read<MovieRepository>(),
            ),
          ),
          BlocProvider<DetailMovieBloc>(
            create: (context) => DetailMovieBloc(
              detailMovieRepository: context.read<DetailMovieRepository>(),
            ),
          ),
          BlocProvider<GenreMovieBloc>(
            create: (context) => GenreMovieBloc(
              genreMovieRepository: context.read<GenreMovieRepository>(),
            ),
          ),
          BlocProvider<VideoMovieBloc>(
            create: (context) => VideoMovieBloc(
              videoMovieRepository: context.read<VideoMovieRepository>(),
            ),
          ),
        ],
        child: const App(),
      ),
    );
  }
}
