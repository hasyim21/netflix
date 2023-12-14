import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/genre_movie_bloc/genre_movie_bloc.dart';
import '../../../data/models/movie/genre_movie.dart';
import 'widgets/genre_loading.dart';
import 'widgets/item_genre.dart';
import 'widgets/search_button.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    context.read<GenreMovieBloc>().add(GetGenreMovieEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 16.0,
            ),
            const SearchButton(),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: BlocBuilder<GenreMovieBloc, GenreMovieState>(
                builder: (context, state) {
                  if (state.status == GenreMovieStatus.loading) {
                    return const GenreLoading();
                  }
                  return GridView.builder(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3.0,
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                    ),
                    itemCount: state.genres.length,
                    itemBuilder: (BuildContext context, int index) {
                      GenreMovie genre = state.genres[index];
                      return ItemGenre(genre: genre);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
