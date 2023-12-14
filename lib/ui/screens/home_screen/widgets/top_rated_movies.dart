import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/movie_bloc/movie_bloc.dart';
import '../../../../data/models/movie/movie.dart';
import '../../../../theme/my_colors.dart';
import '../../../widgets/item_movie.dart';
import 'home_loading.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state.status == MovieStatus.loading) {
          return const HomeLoading(isCarousel: false);
        }
        return SizedBox(
          height: 179.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Top Rated",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: MyColors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              SizedBox(
                height: 152,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.topRatedMovies.length,
                  itemBuilder: (context, index) {
                    Movie movie = state.topRatedMovies[index];
                    return ItemMovie(
                      movie: movie,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 8.0,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
