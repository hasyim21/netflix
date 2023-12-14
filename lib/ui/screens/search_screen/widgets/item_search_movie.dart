import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../constant/constant.dart';
import '../../../../data/models/movie/movie.dart';
import '../../../../theme/my_colors.dart';
import '../../../widgets/no_image.dart';
import '../../detail_movie_screen/detail_movie_screen.dart';

class ItemSearchMovie extends StatelessWidget {
  const ItemSearchMovie({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: MyColors.greyDark1,
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: MyColors.greyDark2,
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
                    height: 152.0,
                    width: 106.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        color: MyColors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Rating: ",
                          style: TextStyle(
                            color: MyColors.white,
                          ),
                        ),
                        const Icon(
                          Icons.star_rate_rounded,
                          size: 20.0,
                          color: Colors.yellow,
                        ),
                        Text(
                          movie.voteAverage?.toStringAsFixed(1) ?? 'N/A',
                          style: const TextStyle(
                            color: MyColors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailMovieScreen(
                      movieId: movie.id!,
                    ),
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
