import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/user_bloc/user_bloc.dart';
import '../../../../constant/constant.dart';
import '../../../../theme/my_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black,
            Colors.black.withOpacity(0.0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/netflix_n_logo.png",
            height: 32.0,
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state.status == UserStatus.loading) {
                return ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                  child: Container(
                    height: 30.0,
                    width: 30.0,
                    color: MyColors.greyLight3,
                  ),
                );
              }

              return ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(4.0),
                ),
                child: Container(
                  height: 32.0,
                  width: 32.0,
                  color: MyColors.greyLight3,
                  child: CachedNetworkImage(
                    imageUrl:
                        "$imageUrlW500${state.user.avatar.tmdb.avatarPath}",
                    errorWidget: (context, _, error) => const SizedBox(),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
