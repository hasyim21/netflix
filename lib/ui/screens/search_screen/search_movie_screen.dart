import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/movie_bloc/movie_bloc.dart';
import 'widgets/item_search_movie.dart';
import 'widgets/search_widget.dart';

class SearchMovieScreen extends StatefulWidget {
  const SearchMovieScreen({super.key});

  @override
  State<SearchMovieScreen> createState() => _SearchMovieScreenState();
}

class _SearchMovieScreenState extends State<SearchMovieScreen> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFocusNode = FocusNode();

  @override
  void initState() {
    _textFocusNode.requestFocus();
    context.read<MovieBloc>().add(RemoveSearchMoviesEvent());
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 16.0,
              ),
              SearchWidget(
                textController: _textController,
                textFocusNode: _textFocusNode,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: BlocBuilder<MovieBloc, MovieState>(
                  builder: (context, state) {
                    if (state.status == MovieStatus.initial) {
                      return const SizedBox();
                    }
                    if (state.status == MovieStatus.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state.searchResults.isEmpty) {
                      return const Center(
                        child: Text('Sorry, the movie could not be found.'),
                      );
                    }

                    return ListView.separated(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      itemCount: state.searchResults.length,
                      itemBuilder: (context, index) {
                        final movie = state.searchResults[index];
                        return ItemSearchMovie(movie: movie);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 8.0,
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
