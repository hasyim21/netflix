import 'package:flutter/material.dart';

import '../../theme/my_colors.dart';

class NoImage extends StatelessWidget {
  const NoImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152.0,
      width: 106.0,
      padding: const EdgeInsets.all(15.0),
      decoration: const BoxDecoration(
        color: MyColors.greyDark2,
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      child: Image.asset(
        "assets/images/no_image.png",
      ),
    );
  }
}
