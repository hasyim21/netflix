import 'package:flutter/material.dart';

import 'my_colors.dart';

class MyTheme {
  static ThemeData theme = ThemeData.dark(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: MyColors.greyDark3,
    colorScheme: ColorScheme.fromSeed(seedColor: MyColors.red),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      color: MyColors.black,
      titleTextStyle: TextStyle(
        color: MyColors.white,
        fontSize: 16.0,
      ),
      iconTheme: IconThemeData(
        color: MyColors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.red,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: MyColors.black,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(fontSize: 12.0),
      unselectedLabelStyle: TextStyle(fontSize: 12.0),
      selectedItemColor: MyColors.white,
      unselectedItemColor: MyColors.grey,
    ),
  );
}
