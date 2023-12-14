import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../data/models/movie/movie.dart';
import '../../theme/my_colors.dart';
import '../screens/detail_movie_screen/detail_movie_screen.dart';
import 'no_image.dart';

class ItemMovie extends StatelessWidget {
  const ItemMovie({
    super.key,
    required this.movie,
    this.aspectRatio = false,
  });

  final Movie movie;
  final bool? aspectRatio;

  @override
  Widget build(BuildContext context) {
    return (aspectRatio == false)
        ? Stack(
            children: [
              Container(
                height: 152.0,
                width: 106.0,
                decoration: const BoxDecoration(
                  color: MyColors.greyDark1,
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: "$imageUrlW500${movie.posterPath}",
                    errorWidget: (context, _, error) => const NoImage(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailMovieScreen(movieId: movie.id!),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )
        : Stack(
            children: [
              AspectRatio(
                aspectRatio: 0.697,
                child: Container(
                  height: 152.0,
                  width: 106.0,
                  decoration: const BoxDecoration(
                    color: MyColors.greyDark1,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: "$imageUrlW500${movie.posterPath}",
                      errorWidget: (context, _, error) => const NoImage(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailMovieScreen(movieId: movie.id!),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
  }
}
