import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/models/movie/movie.dart';
import '../../data/repositories/movie_repository/movie_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  MovieBloc({required this.movieRepository}) : super(MovieState.initial()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      emit(state.copyWith(status: MovieStatus.loading));

      try {
        final List<Movie> nowPlayingMovies =
            await movieRepository.getNowPlayingMovies();
        emit(state.copyWith(
            status: MovieStatus.success, nowPlayingMovies: nowPlayingMovies));
      } catch (e) {
        emit(state.copyWith(status: MovieStatus.error, error: e.toString()));
      }
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      emit(state.copyWith(status: MovieStatus.loading));

      try {
        final List<Movie> popularMovies =
            await movieRepository.getPopularMovies();
        emit(state.copyWith(
            status: MovieStatus.success, popularMovies: popularMovies));
      } catch (e) {
        emit(state.copyWith(status: MovieStatus.error, error: e.toString()));
      }
    });

    on<GetTopRatedMoviesEvent>((event, emit) async {
      emit(state.copyWith(status: MovieStatus.loading));

      try {
        final List<Movie> topRatedMovies =
            await movieRepository.getTopRatedMovies();
        emit(state.copyWith(
            status: MovieStatus.success, topRatedMovies: topRatedMovies));
      } catch (e) {
        emit(state.copyWith(status: MovieStatus.error, error: e.toString()));
      }
    });

    on<GetUpcomingMoviesEvent>((event, emit) async {
      emit(state.copyWith(status: MovieStatus.loading));

      try {
        final List<Movie> upcomingMovies =
            await movieRepository.getUpcomingMovies();
        emit(state.copyWith(
            status: MovieStatus.success, upcomingMovies: upcomingMovies));
      } catch (e) {
        emit(state.copyWith(status: MovieStatus.error, error: e.toString()));
      }
    });

    on<GetMovieByGenreEvent>((event, emit) async {
      emit(state.copyWith(status: MovieStatus.loading));

      try {
        final List<Movie> movieByGenre =
            await movieRepository.getMovieByGenre(event.genreId);
        emit(state.copyWith(
            status: MovieStatus.success, movieByGenre: movieByGenre));
      } catch (e) {
        emit(state.copyWith(status: MovieStatus.error, error: e.toString()));
      }
    });

    on<GetSearchMoviesEvent>((event, emit) async {
      emit(state.copyWith(status: MovieStatus.loading));

      try {
        final List<Movie> searchResults =
            await movieRepository.getSearchMovies(event.query);
        emit(state.copyWith(
            status: MovieStatus.success, searchResults: searchResults));
      } catch (e) {
        emit(state.copyWith(status: MovieStatus.error, error: e.toString()));
      }
    }, transformer: debounce(const Duration(milliseconds: 1000)));

    on<RemoveSearchMoviesEvent>((event, emit) {
      emit(state.copyWith(status: MovieStatus.initial));
      emit(state.copyWith(searchResults: []));
    });
  }

  EventTransformer<SetSearchTermEvent> debounce<SetSearchTermEvent>(
      Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
