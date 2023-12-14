import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/movie/genre_movie.dart';
import '../../data/repositories/genre_movie_repository/genre_movie_repository.dart';

part 'genre_movie_event.dart';
part 'genre_movie_state.dart';

class GenreMovieBloc extends Bloc<GenreMovieEvent, GenreMovieState> {
  final GenreMovieRepository genreMovieRepository;

  GenreMovieBloc({required this.genreMovieRepository})
      : super(GenreMovieState.initial()) {
    on<GetGenreMovieEvent>((event, emit) async {
      emit(state.copyWith(status: GenreMovieStatus.loading));

      try {
        final List<GenreMovie> genres = await genreMovieRepository.getGenres();
        emit(state.copyWith(status: GenreMovieStatus.success, genres: genres));
      } catch (e) {
        emit(state.copyWith(
            status: GenreMovieStatus.error, error: e.toString()));
      }
    });
  }
}
