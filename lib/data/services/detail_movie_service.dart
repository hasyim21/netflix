import 'package:dio/dio.dart';

import '../../constant/constant.dart';
import '../models/movie/detail_movie.dart';
import '../models/movie/video_movie.dart';

class DetailMovieService {
  final Dio _dio = Dio();

  Future<DetailMovie> getDetailMovie(int movieId) async {
    try {
      final response = await _dio.get("$baseUrl/movie/$movieId?$apiKey");

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        return DetailMovie.fromJson(data);
      } else {
        throw Exception("Failed to load. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error: $error");
    }
  }

  Future<List<Map<String, dynamic>>?> getImages(int movieId) async {
    try {
      final response = await _dio.get("$baseUrl/movie/$movieId/images?$apiKey");

      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(response.data["backdrops"]);
      } else {
        throw Exception("Failed to load. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error: $error");
    }
  }

  Future<Video?> getVideo(int movieId) async {
    try {
      final response = await _dio.get("$baseUrl/movie/$movieId/videos?$apiKey");

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        final List<dynamic> results = data["results"];

        final trailers = results
            .where((result) => result["type"] == "Trailer")
            .map((result) => Video.fromJson(result))
            .toList();

        if (trailers.isNotEmpty) {
          return trailers[0];
        } else {
          return null;
        }
      } else {
        throw Exception("Failed to load. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error: $error");
    }
  }
}
