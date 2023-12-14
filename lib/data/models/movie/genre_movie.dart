import 'package:equatable/equatable.dart';

class GenreMovie extends Equatable {
  final int id;
  final String name;

  const GenreMovie({required this.id, required this.name});

  factory GenreMovie.fromJson(Map<String, dynamic> json) {
    return GenreMovie(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  List<Object> get props => [id, name];

  @override
  String toString() => 'GenreMovie(id: $id, name: $name)';
}
