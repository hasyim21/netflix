import '../../models/movie/movie.dart';

abstract class MovieRepositoryProvider {
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
  Future<List<Movie>> getUpcomingMovies();
  Future<List<Movie>> getMovieByGenre(int genreId);
  Future<List<Movie>> getSearchMovies(String query);
}
