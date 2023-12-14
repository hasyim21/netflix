import '../../models/movie/video_movie.dart';
import '../../services/detail_movie_service.dart';
import 'video_movie_repository_provider.dart';

class VideoMovieRepository implements VideoMovieRepositoryProvider {
  final DetailMovieService videoMovieService;

  VideoMovieRepository({required this.videoMovieService});

  @override
  Future<Video?> getVideo(int movieId) async {
    try {
      final Video? video = await videoMovieService.getVideo(movieId);

      return video;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
