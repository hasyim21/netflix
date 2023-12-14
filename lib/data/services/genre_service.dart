import 'package:dio/dio.dart';

import '../../constant/constant.dart';
import '../models/movie/genre_movie.dart';

class GenreMovieService {
  final Dio _dio = Dio();

  Future<List<GenreMovie>> getGenres() async {
    try {
      final response = await _dio.get("$baseUrl/genre/movie/list?$apiKey");

      if (response.statusCode == 200) {
        var results = response.data["genres"] as List;
        List<GenreMovie> genres =
            results.map((data) => GenreMovie.fromJson(data)).toList();
        return genres;
      } else {
        throw Exception("Failed to load. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error: $error");
    }
  }
}
