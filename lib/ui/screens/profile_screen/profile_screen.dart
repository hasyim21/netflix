import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/constant/constant.dart';

import '../../../blocs/auth_bloc/auth_bloc.dart';
import '../../../blocs/user_bloc/user_bloc.dart';
import '../../../theme/my_colors.dart';
import '../../widgets/buttons/my_text_button.dart';
// import '../login_screen/login_screen.dart';
import 'widgets/item_setting.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        children: [
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return ListTile(
                leading: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    color: MyColors.greyLight3,
                    child: CachedNetworkImage(
                      imageUrl:
                          "$imageUrlW500${state.user.avatar.tmdb.avatarPath}",
                      errorWidget: (context, _, error) => const SizedBox(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  state.user.username,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: MyColors.white,
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 30.0,
          ),
          ItemSetting(
            icon: Icons.person_outline,
            title: "Account",
            onTap: () {},
          ),
          ItemSetting(
            icon: Icons.help_outline,
            title: "Help",
            onTap: () {},
          ),
          const SizedBox(
            height: 50.0,
          ),
          MyTextButton(
            label: "Sign Out",
            labelColor: MyColors.grey,
            onPressed: () {
              context.read<AuthBloc>().add(LoggedOut());
            },
          ),
        ],
      ),
    );
  }
}
