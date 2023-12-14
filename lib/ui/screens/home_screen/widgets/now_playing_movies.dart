import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/movie_bloc/movie_bloc.dart';
import '../../../../constant/constant.dart';
import '../../../../theme/my_colors.dart';
import 'home_loading.dart';
import 'now_playing_movies_control_buttons.dart';

class NowPlayingMovies extends StatefulWidget {
  const NowPlayingMovies({super.key});

  @override
  State<NowPlayingMovies> createState() => _NowPlayingMoviesState();
}

class _NowPlayingMoviesState extends State<NowPlayingMovies> {
  final CarouselController _carouselController = CarouselController();
  int _currentCarouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state.status == MovieStatus.loading) {
          return const HomeLoading(isCarousel: true);
        }
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.66,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                autoPlayInterval: const Duration(seconds: 5),
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentCarouselIndex = index;
                  });
                },
              ),
              items: state.nowPlayingMovies.map((movie) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  color: MyColors.greyDark1,
                  child: CachedNetworkImage(
                    imageUrl: "$imageUrlOriginal${movie.posterPath}",
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
            ),
            NowPlayingMoviesControlButtons(
                currentCarouselIndex: _currentCarouselIndex),
          ],
        );
      },
    );
  }
}
