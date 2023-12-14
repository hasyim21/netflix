part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetNowPlayingMoviesEvent extends MovieEvent {}

class GetPopularMoviesEvent extends MovieEvent {}

class GetTopRatedMoviesEvent extends MovieEvent {}

class GetUpcomingMoviesEvent extends MovieEvent {}

class GetMovieByGenreEvent extends MovieEvent {
  final int genreId;

  const GetMovieByGenreEvent({required this.genreId});

  @override
  List<Object> get props => [genreId];
}

class GetSearchMoviesEvent extends MovieEvent {
  final String query;

  const GetSearchMoviesEvent({required this.query});

  @override
  List<Object> get props => [query];
}

class RemoveSearchMoviesEvent extends MovieEvent {}
