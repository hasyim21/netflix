import '../../models/movie/genre_movie.dart';

abstract class GenreMovieRepositoryProvider {
  Future<List<GenreMovie>> getGenres();
}
