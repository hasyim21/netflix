import '../../models/movie/movie.dart';
import '../../services/movie_service.dart';
import 'movie_repository_provider.dart';

class MovieRepository implements MovieRepositoryProvider {
  final MovieService movieService;

  MovieRepository({required this.movieService});

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    try {
      final List<Movie> newMovies = await movieService.getNowPlayingMovies();

      return newMovies;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    try {
      final List<Movie> popularMovies = await movieService.getPopularMovies();

      return popularMovies;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  @override
  Future<List<Movie>> getTopRatedMovies() async {
    try {
      final List<Movie> topRatedMovies = await movieService.getTopRatedMovies();

      return topRatedMovies;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  @override
  Future<List<Movie>> getUpcomingMovies() async {
    try {
      final List<Movie> upcomingMovies = await movieService.getUpcomingMovies();

      return upcomingMovies;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  @override
  Future<List<Movie>> getMovieByGenre(int genreId) async {
    try {
      final List<Movie> movieByGenre =
          await movieService.getMovieByGenre(genreId);

      return movieByGenre;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  @override
  Future<List<Movie>> getSearchMovies(String query) async {
    try {
      final List<Movie> resultMovies =
          await movieService.getSearchMovies(query);

      return resultMovies;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
