part of 'movie_bloc.dart';

enum MovieStatus {
  initial,
  loading,
  success,
  error,
}

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final List<Movie> upcomingMovies;
  final List<Movie> movieByGenre;
  final List<Movie> searchResults;
  final MovieStatus status;
  final String error;

  const MovieState({
    required this.nowPlayingMovies,
    required this.popularMovies,
    required this.topRatedMovies,
    required this.upcomingMovies,
    required this.movieByGenre,
    required this.searchResults,
    required this.status,
    required this.error,
  });

  factory MovieState.initial() {
    return const MovieState(
      nowPlayingMovies: [],
      popularMovies: [],
      topRatedMovies: [],
      upcomingMovies: [],
      movieByGenre: [],
      searchResults: [Movie()],
      status: MovieStatus.initial,
      error: '',
    );
  }

  MovieState copyWith({
    List<Movie>? nowPlayingMovies,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    List<Movie>? upcomingMovies,
    List<Movie>? movieByGenre,
    List<Movie>? searchResults,
    MovieStatus? status,
    String? error,
  }) {
    return MovieState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      movieByGenre: movieByGenre ?? this.movieByGenre,
      searchResults: searchResults ?? this.searchResults,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props {
    return [
      nowPlayingMovies,
      popularMovies,
      topRatedMovies,
      upcomingMovies,
      movieByGenre,
      searchResults,
      status,
      error,
    ];
  }

  @override
  String toString() {
    return 'MovieState(nowPlayingMovies: $nowPlayingMovies, popularMovies: $popularMovies, topRatedMovies: $topRatedMovies, upcomingMovies: $upcomingMovies, movieByGenre: $movieByGenre, searchResults: $searchResults, status: $status, error: $error)';
  }
}
