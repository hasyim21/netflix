part of 'detail_movie_bloc.dart';

enum DetailMovieStatus {
  initial,
  loading,
  success,
  error,
}

class DetailMovieState extends Equatable {
  final DetailMovie detailMovie;
  final List<Map<String, dynamic>>? images;
  final Video? video;
  final DetailMovieStatus status;
  final String error;

  const DetailMovieState({
    required this.detailMovie,
    this.images,
    this.video,
    required this.status,
    required this.error,
  });

  factory DetailMovieState.initial() {
    return const DetailMovieState(
      detailMovie: DetailMovie(),
      images: [],
      status: DetailMovieStatus.initial,
      error: '',
    );
  }

  DetailMovieState copyWith({
    DetailMovie? detailMovie,
    List<Map<String, dynamic>>? images,
    Video? video,
    DetailMovieStatus? status,
    String? error,
  }) {
    return DetailMovieState(
      detailMovie: detailMovie ?? this.detailMovie,
      images: images ?? this.images,
      video: video ?? this.video,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props {
    return [
      detailMovie,
      images,
      video,
      status,
      error,
    ];
  }

  @override
  String toString() {
    return 'DetailMovieState(detailMovie: $detailMovie, images: $images, video: $video, status: $status, error: $error)';
  }
}
