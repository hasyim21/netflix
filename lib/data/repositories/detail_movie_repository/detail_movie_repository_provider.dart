import '../../models/movie/detail_movie.dart';
import '../../models/movie/video_movie.dart';

abstract class DetailMovieRepositoryProvider {
  Future<DetailMovie> getDetailMovie(int movieId);
  Future<List<Map<String, dynamic>>?> getImages(int movieId);
  Future<Video?> getVideo(int movieId);
}
