import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/detail_movie_bloc/detail_movie_bloc.dart';
import '../../../../theme/my_colors.dart';
import 'detail_loading.dart';

class DescriptionMovie extends StatelessWidget {
  const DescriptionMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailMovieBloc, DetailMovieState>(
      builder: (context, state) {
        if (state.status == DetailMovieStatus.loading) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailLoading(height: 20, width: 150),
              DetailLoading(height: 20, width: 75),
              DetailLoading(height: 40, width: 150),
              DetailLoading(height: 100),
            ],
          );
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.detailMovie.title ?? '',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: MyColors.white,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    size: 21.0,
                    color: Colors.yellow,
                  ),
                  Text(
                    state.detailMovie.voteAverage?.toStringAsFixed(1) ?? 'N/A',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: MyColors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 4.0,
              ),
              Wrap(
                spacing: 8.0,
                children: state.detailMovie.genres?.map((genre) {
                      return Chip(
                        label: Text(
                          genre.name,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: MyColors.white,
                          ),
                        ),
                        backgroundColor: MyColors.greyDark1,
                      );
                    }).toList() ??
                    [],
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Text(
                "Synopsis",
                style: TextStyle(
                  fontSize: 16.0,
                  color: MyColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                state.detailMovie.overview ?? '',
                style: const TextStyle(
                  fontSize: 14.0,
                  color: MyColors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
