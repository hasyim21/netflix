import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/movie_bloc/movie_bloc.dart';
import '../../../../blocs/video_movie_bloc/video_movie_bloc.dart';
import '../../../../theme/my_colors.dart';
import '../../../widgets/buttons/my_icon_text_button.dart';
import '../../../widgets/my_alert_dialog.dart';
import '../../../widgets/youtube_player_widget.dart';
import '../../detail_movie_screen/detail_movie_screen.dart';

class NowPlayingMoviesControlButtons extends StatelessWidget {
  const NowPlayingMoviesControlButtons({
    super.key,
    required int currentCarouselIndex,
  }) : _currentCarouselIndex = currentCarouselIndex;

  final int _currentCarouselIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.0),
            Colors.black,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                return Expanded(
                  child: MyIconTextButton(
                    icon: Icons.play_arrow,
                    label: "Play",
                    onPressed: () {
                      context.read<VideoMovieBloc>().add(GetVideoMovieEvent(
                          movieId: state
                              .nowPlayingMovies[_currentCarouselIndex].id!));

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BlocConsumer<VideoMovieBloc, VideoMovieState>(
                            listener: (context, state) async {
                              if (state.video == null ||
                                  state.video!.key.isEmpty) {
                                await myAlertDialog(
                                  context: context,
                                  title: "Movie is empty",
                                  content: "The movie is empty or unavailable.",
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state.status == VideoMovieStatus.loading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              return YoutubePlayerWidget(
                                youtubeKey: state.video!.key,
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(
              width: 8.0,
            ),
            BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                return Expanded(
                  child: MyIconTextButton(
                    icon: Icons.info_outline,
                    iconColor: MyColors.white,
                    label: "Info",
                    labelColor: MyColors.white,
                    backgroundColor: MyColors.greyDark2,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailMovieScreen(
                            movieId: state
                                .nowPlayingMovies[_currentCarouselIndex].id!,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
