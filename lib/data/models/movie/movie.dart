import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String? backdropPath;
  final int? id;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? title;
  final double? voteAverage;
  final int? voteCount;
  final String? releaseDate;

  const Movie({
    this.backdropPath,
    this.id,
    this.overview,
    this.popularity,
    this.posterPath,
    this.title,
    this.voteAverage,
    this.voteCount,
    this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      backdropPath: json['backdrop_path'] ?? '',
      id: json['id'] as int?,
      overview: json['overview'] ?? '',
      popularity: json['popularity']?.toDouble(),
      posterPath: json['poster_path'] ?? '',
      title: json['title'] ?? '',
      voteAverage: json['vote_average']?.toDouble(),
      voteCount: json['vote_count'] as int?,
      releaseDate: json['release_date'] ?? '',
    );
  }

  @override
  List<Object?> get props {
    return [
      backdropPath,
      id,
      overview,
      popularity,
      posterPath,
      title,
      voteAverage,
      voteCount,
      releaseDate,
    ];
  }

  @override
  String toString() {
    return 'Movie(backdropPath: $backdropPath, id: $id, overview: $overview, popularity: $popularity, posterPath: $posterPath, title: $title, voteAverage: $voteAverage, voteCount: $voteCount, releaseDate: $releaseDate)';
  }
}
