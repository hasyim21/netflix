import 'package:flutter/material.dart';

import 'theme/my_theme.dart';
import 'ui/screens/splash_screen/splash_screen.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix',
      theme: MyTheme.theme,
      home: const SplashScreen(),
    );
  }
}
