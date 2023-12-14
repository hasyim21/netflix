import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/detail_movie_bloc/detail_movie_bloc.dart';
import '../../../../constant/constant.dart';
import '../../../../theme/my_colors.dart';
import '../../../widgets/no_image.dart';
import 'detail_loading.dart';
import '../../../widgets/youtube_player_widget.dart';

class PlayVideoMovie extends StatelessWidget {
  const PlayVideoMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailMovieBloc, DetailMovieState>(
      builder: (context, state) {
        if (state.status == DetailMovieStatus.loading) {
          return const DetailLoading(height: 210);
        }
        return (state.video != null)
            ? Stack(
                children: [
                  Container(
                    color: MyColors.greyDark1,
                    child: CachedNetworkImage(
                      imageUrl:
                          "$imageUrlOriginal${state.detailMovie.backdropPath}",
                      errorWidget: (context, _, error) => const NoImage(),
                      height: 210,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 210,
                    width: MediaQuery.of(context).size.width,
                    color: MyColors.black.withOpacity(0.25),
                  ),
                  SizedBox(
                    height: 210,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: MyColors.white,
                          ),
                        ),
                        Center(
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => YoutubePlayerWidget(
                                    youtubeKey: state.video!.key,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.play_circle_outline,
                              size: 50.0,
                              color: MyColors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 48.0,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Stack(
                children: [
                  Container(
                    height: 210,
                    width: MediaQuery.of(context).size.width,
                    color: MyColors.greyDark1,
                    child: Image.asset(
                      "assets/images/no_image.png",
                      width: 100.0,
                      height: 100.0,
                    ),
                  ),
                  SizedBox(
                    height: 210,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: MyColors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 48.0,
                        ),
                      ],
                    ),
                  ),
                ],
              );
      },
    );
  }
}
