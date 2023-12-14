part of 'video_movie_bloc.dart';

abstract class VideoMovieEvent extends Equatable {
  const VideoMovieEvent();

  @override
  List<Object> get props => [];
}

class GetVideoMovieEvent extends VideoMovieEvent {
  final int movieId;

  const GetVideoMovieEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
