import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/movie_bloc/movie_bloc.dart';
import 'widget/item_upcoming_movie.dart';
import 'widget/upcoming_loading.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({super.key});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  @override
  void initState() {
    context.read<MovieBloc>().add(GetUpcomingMoviesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upcoming"),
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state.status == MovieStatus.loading) {
            return const UpcomingLoading();
          }
          return ListView.separated(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            itemCount: state.upcomingMovies.length,
            itemBuilder: (context, index) {
              final movie = state.upcomingMovies[index];
              return ItemUpcomingMovie(movie: movie);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 8.0,
              );
            },
          );
        },
      ),
    );
  }
}
