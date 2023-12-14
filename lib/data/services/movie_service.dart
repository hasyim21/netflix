import "package:dio/dio.dart";

import '../../constant/constant.dart';
import '../models/movie/movie.dart';

class MovieService {
  final Dio _dio = Dio();

  Future<List<Movie>> getNowPlayingMovies() async {
    try {
      final response = await _dio.get("$baseUrl/movie/now_playing?$apiKey");

      if (response.statusCode == 200) {
        var results = response.data["results"] as List;
        final List<Movie> movies =
            results.map((data) => Movie.fromJson(data)).toList();
        return movies;
      } else {
        throw Exception("Failed to load. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error: $error");
    }
  }

  Future<List<Movie>> getPopularMovies() async {
    try {
      final response = await _dio.get("$baseUrl/movie/popular?$apiKey");

      if (response.statusCode == 200) {
        var results = response.data["results"] as List;
        final List<Movie> movies =
            results.map((data) => Movie.fromJson(data)).toList();
        return movies;
      } else {
        throw Exception("Failed to load. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error: $error");
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    try {
      final response = await _dio.get("$baseUrl/movie/top_rated?$apiKey");

      if (response.statusCode == 200) {
        var results = response.data["results"] as List;
        final List<Movie> movies =
            results.map((data) => Movie.fromJson(data)).toList();
        return movies;
      } else {
        throw Exception("Failed to load. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error: $error");
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    try {
      final response = await _dio.get("$baseUrl/movie/upcoming?$apiKey");

      if (response.statusCode == 200) {
        var results = response.data["results"] as List;
        final List<Movie> movies =
            results.map((data) => Movie.fromJson(data)).toList();
        return movies;
      } else {
        throw Exception("Failed to load. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error: $error");
    }
  }

  Future<List<Movie>> getMovieByGenre(int genreId) async {
    try {
      final response = await _dio
          .get("$baseUrl/discover/movie?with_genres=$genreId&$apiKey");

      if (response.statusCode == 200) {
        var results = response.data["results"] as List;
        final List<Movie> movies =
            results.map((data) => Movie.fromJson(data)).toList();

        return movies;
      } else {
        throw Exception("Failed to load. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error: $error");
    }
  }

  Future<List<Movie>> getSearchMovies(String query) async {
    try {
      final response =
          await _dio.get("$baseUrl/search/movie?query=$query&$apiKey");

      if (response.statusCode == 200) {
        var results = response.data["results"] as List;
        final List<Movie> movies =
            results.map((data) => Movie.fromJson(data)).toList();

        return movies;
      } else {
        throw Exception(
            "Failed to search. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error: $error");
    }
  }
}
