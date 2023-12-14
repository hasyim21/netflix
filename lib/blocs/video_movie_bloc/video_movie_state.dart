part of 'video_movie_bloc.dart';

enum VideoMovieStatus {
  initial,
  loading,
  success,
  error,
}

class VideoMovieState extends Equatable {
  final Video? video;
  final VideoMovieStatus status;
  final String error;

  const VideoMovieState({
    this.video,
    required this.status,
    required this.error,
  });

  factory VideoMovieState.initial() {
    return const VideoMovieState(
      status: VideoMovieStatus.initial,
      error: '',
    );
  }

  VideoMovieState copyWith({
    Video? video,
    VideoMovieStatus? status,
    String? error,
  }) {
    return VideoMovieState(
      video: video ?? this.video,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [video, status, error];

  @override
  String toString() =>
      'VideoMovieState(video: $video, status: $status, error: $error)';
}
