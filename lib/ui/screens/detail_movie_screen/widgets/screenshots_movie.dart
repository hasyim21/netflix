import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/detail_movie_bloc/detail_movie_bloc.dart';
import '../../../../constant/constant.dart';
import '../../../../theme/my_colors.dart';
import 'detail_loading.dart';

class ScreenshotsMovie extends StatelessWidget {
  const ScreenshotsMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: BlocBuilder<DetailMovieBloc, DetailMovieState>(
        builder: (context, state) {
          if (state.status == DetailMovieStatus.loading) {
            return const DetailLoading(height: 150);
          }
          return ListView.builder(
            padding: const EdgeInsets.only(left: 8.0),
            itemCount: (state.images!.length > 5) ? 5 : state.images!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index < state.images!.length) {
                final image = state.images![index];
                return Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  height: 150,
                  width: MediaQuery.of(context).size.width * 0.75,
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
                      imageUrl: "$imageUrlOriginal${image["file_path"]}",
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          );
        },
      ),
    );
  }
}
