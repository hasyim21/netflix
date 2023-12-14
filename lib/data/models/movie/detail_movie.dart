import 'package:equatable/equatable.dart';

import 'genre_movie.dart';

class DetailMovie extends Equatable {
  final String? backdropPath;
  final List<GenreMovie>? genres;
  final int? id;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final DateTime? releaseDate;
  final String? status;
  final String? tagline;
  final String? title;
  final double? voteAverage;
  final int? voteCount;

  const DetailMovie({
    this.backdropPath,
    this.genres,
    this.id,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.status,
    this.tagline,
    this.title,
    this.voteAverage,
    this.voteCount,
  });

  factory DetailMovie.fromJson(Map<String, dynamic> json) {
    return DetailMovie(
      backdropPath: json["backdrop_path"] ?? '',
      genres: (json["genres"] as List?)
          ?.map((x) => GenreMovie.fromJson(x))
          .toList(),
      id: json["id"] as int?,
      overview: json["overview"] ?? '',
      popularity: json["popularity"]?.toDouble(),
      posterPath: json["poster_path"] ?? '',
      releaseDate: json["release_date"] != null
          ? DateTime.tryParse(json["release_date"])
          : null,
      status: json["status"] ?? '',
      tagline: json["tagline"] ?? '',
      title: json["title"] ?? '',
      voteAverage: json["vote_average"]?.toDouble(),
      voteCount: json["vote_count"] as int?,
    );
  }

  @override
  List<Object?> get props {
    return [
      backdropPath,
      genres,
      id,
      overview,
      popularity,
      posterPath,
      releaseDate,
      status,
      tagline,
      title,
      voteAverage,
      voteCount,
    ];
  }

  @override
  String toString() {
    return 'DetailMovie(backdropPath: $backdropPath, genres: $genres, id: $id, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, status: $status, tagline: $tagline, title: $title, voteAverage: $voteAverage, voteCount: $voteCount)';
  }
}
