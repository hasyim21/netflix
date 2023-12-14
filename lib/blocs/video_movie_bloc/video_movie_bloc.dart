import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/movie/video_movie.dart';
import '../../data/repositories/video_movie_repository/video_movie_repository.dart';

part 'video_movie_event.dart';
part 'video_movie_state.dart';

class VideoMovieBloc extends Bloc<VideoMovieEvent, VideoMovieState> {
  VideoMovieRepository videoMovieRepository;
  VideoMovieBloc({required this.videoMovieRepository})
      : super(VideoMovieState.initial()) {
    on<GetVideoMovieEvent>((event, emit) async {
      emit(state.copyWith(status: VideoMovieStatus.loading));

      try {
        final Video? video = await videoMovieRepository.getVideo(event.movieId);
        emit(state.copyWith(status: VideoMovieStatus.success, video: video));
      } catch (e) {
        emit(state.copyWith(
            status: VideoMovieStatus.error, error: e.toString()));
      }
    });
  }
}
