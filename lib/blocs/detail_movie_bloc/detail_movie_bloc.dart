import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/movie/detail_movie.dart';
import '../../data/models/movie/video_movie.dart';
import '../../data/repositories/detail_movie_repository/detail_movie_repository.dart';

part 'detail_movie_event.dart';
part 'detail_movie_state.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  final DetailMovieRepository detailMovieRepository;

  DetailMovieBloc({required this.detailMovieRepository})
      : super(DetailMovieState.initial()) {
    on<GetDetailMovieEvent>((event, emit) async {
      emit(state.copyWith(status: DetailMovieStatus.loading));
      try {
        final DetailMovie detailMovie =
            await detailMovieRepository.getDetailMovie(event.movieId);
        final List<Map<String, dynamic>> images =
            await detailMovieRepository.getImages(event.movieId);
        final Video? video =
            await detailMovieRepository.getVideo(event.movieId);
        emit(
          state.copyWith(
              status: DetailMovieStatus.success,
              detailMovie: detailMovie,
              images: images,
              video: video),
        );
      } catch (e) {
        emit(state.copyWith(
            status: DetailMovieStatus.error, error: e.toString()));
      }
    });
  }
}
