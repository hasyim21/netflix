import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/movie_bloc/movie_bloc.dart';
import '../../../data/models/movie/movie.dart';
import '../../widgets/item_movie.dart';
import 'widgets/movie_by_genre_loading.dart';

class MovieByGenreScreen extends StatefulWidget {
  const MovieByGenreScreen({
    super.key,
    required this.genreName,
    required this.genreId,
  });

  final String genreName;
  final int genreId;

  @override
  State<MovieByGenreScreen> createState() => _MovieByGenreScreenState();
}

class _MovieByGenreScreenState extends State<MovieByGenreScreen> {
  @override
  void initState() {
    context.read<MovieBloc>().add(
          GetMovieByGenreEvent(genreId: widget.genreId),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.genreName),
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state.status == MovieStatus.loading) {
            return const MovieByGenreLoading();
          }
          return GridView.builder(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.697,
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: state.movieByGenre.length,
            itemBuilder: (BuildContext context, int index) {
              final Movie movie = state.movieByGenre[index];
              return ItemMovie(
                movie: movie,
                aspectRatio: true,
              );
            },
          );
        },
      ),
    );
  }
}
