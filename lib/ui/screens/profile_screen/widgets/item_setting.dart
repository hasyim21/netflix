import 'package:flutter/material.dart';

import '../../../../theme/my_colors.dart';

class ItemSetting extends StatelessWidget {
  const ItemSetting({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(
        Radius.circular(4.0),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: MyColors.white,
          size: 28.0,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: MyColors.white,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: MyColors.white,
          size: 18.0,
        ),
      ),
    );
  }
}
