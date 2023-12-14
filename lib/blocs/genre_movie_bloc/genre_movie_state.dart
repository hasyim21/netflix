part of 'genre_movie_bloc.dart';

enum GenreMovieStatus {
  initial,
  loading,
  success,
  error,
}

class GenreMovieState extends Equatable {
  final List<GenreMovie> genres;
  final GenreMovieStatus status;
  final String error;

  const GenreMovieState({
    required this.genres,
    required this.status,
    required this.error,
  });

  factory GenreMovieState.initial() {
    return const GenreMovieState(
      genres: [],
      status: GenreMovieStatus.initial,
      error: '',
    );
  }

  GenreMovieState copyWith({
    List<GenreMovie>? genres,
    GenreMovieStatus? status,
    String? error,
  }) {
    return GenreMovieState(
      genres: genres ?? this.genres,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [genres, status, error];

  @override
  String toString() =>
      'GenreMovieState(genres: $genres, status: $status, error: $error)';
}
