import '../../models/movie/genre_movie.dart';
import '../../services/genre_service.dart';
import 'genre_movie_repository_provider.dart';

class GenreMovieRepository implements GenreMovieRepositoryProvider {
  GenreMovieService genreMovieService;

  GenreMovieRepository({required this.genreMovieService});

  @override
  Future<List<GenreMovie>> getGenres() async {
    try {
      final List<GenreMovie> genres = await genreMovieService.getGenres();

      return genres;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
