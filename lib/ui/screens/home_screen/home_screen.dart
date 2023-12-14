import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/movie_bloc/movie_bloc.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/now_playing_movies.dart';
import 'widgets/popular_movies.dart';
import 'widgets/top_rated_movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<MovieBloc>()
      ..add(GetNowPlayingMoviesEvent())
      ..add(GetPopularMoviesEvent())
      ..add(GetTopRatedMoviesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            ListView(
              children: const [
                NowPlayingMovies(),
                SizedBox(
                  height: 8.0,
                ),
                PopularMovies(),
                SizedBox(
                  height: 8.0,
                ),
                TopRatedMovies(),
                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
            const CustomAppBar(),
          ],
        ),
      ),
    );
  }
}
