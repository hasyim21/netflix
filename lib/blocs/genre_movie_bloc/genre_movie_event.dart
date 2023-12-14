part of 'genre_movie_bloc.dart';

abstract class GenreMovieEvent extends Equatable {
  const GenreMovieEvent();

  @override
  List<Object> get props => [];
}

class GetGenreMovieEvent extends GenreMovieEvent {}
