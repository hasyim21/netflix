import '../../models/movie/video_movie.dart';

abstract class VideoMovieRepositoryProvider {
  Future<Video?> getVideo(int movieId);
}
