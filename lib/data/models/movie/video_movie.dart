import 'package:equatable/equatable.dart';

class VideoMovie extends Equatable {
  final int id;
  final List<Video> results;

  const VideoMovie({
    required this.id,
    required this.results,
  });

  factory VideoMovie.fromJson(Map<String, dynamic> json) => VideoMovie(
        id: json["id"],
        results:
            List<Video>.from(json["results"].map((x) => Video.fromJson(x))),
      );

  @override
  List<Object> get props => [id, results];

  @override
  String toString() => 'VideoMovie(id: $id, results: $results)';
}

class Video extends Equatable {
  final String name;
  final String key;
  final String site;
  final String type;
  final bool official;
  final String id;

  const Video({
    required this.name,
    required this.key,
    required this.site,
    required this.type,
    required this.official,
    required this.id,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        name: json["name"],
        key: json["key"],
        site: json["site"],
        type: json["type"],
        official: json["official"],
        id: json["id"],
      );

  @override
  List<Object> get props {
    return [
      name,
      key,
      site,
      type,
      official,
      id,
    ];
  }

  @override
  String toString() {
    return 'Results(name: $name, key: $key, site: $site, type: $type, official: $official, id: $id)';
  }
}
