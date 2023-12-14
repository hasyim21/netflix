import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/blocs/detail_movie_bloc/detail_movie_bloc.dart';

import 'widgets/description_movie.dart';
import 'widgets/play_video_movie.dart';
import 'widgets/screenshots_movie.dart';

class DetailMovieScreen extends StatefulWidget {
  const DetailMovieScreen({super.key, required this.movieId});

  final int movieId;

  @override
  State<DetailMovieScreen> createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  @override
  void initState() {
    context.read<DetailMovieBloc>().add(
          GetDetailMovieEvent(movieId: widget.movieId),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          PlayVideoMovie(),
          DescriptionMovie(),
          ScreenshotsMovie(),
        ],
      ),
    );
  }
}
