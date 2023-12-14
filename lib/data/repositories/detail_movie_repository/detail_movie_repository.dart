import '../../models/movie/detail_movie.dart';
import '../../models/movie/video_movie.dart';
import '../../services/detail_movie_service.dart';
import 'detail_movie_repository_provider.dart';

class DetailMovieRepository implements DetailMovieRepositoryProvider {
  final DetailMovieService detailMovieService;

  DetailMovieRepository({required this.detailMovieService});

  @override
  Future<DetailMovie> getDetailMovie(int movieId) async {
    try {
      final DetailMovie newMovies =
          await detailMovieService.getDetailMovie(movieId);

      return newMovies;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getImages(int movieId) async {
    try {
      final List<Map<String, dynamic>>? images =
          await detailMovieService.getImages(movieId);

      return images ?? [];
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  @override
  Future<Video?> getVideo(int movieId) async {
    try {
      final Video? video = await detailMovieService.getVideo(movieId);

      return video;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
