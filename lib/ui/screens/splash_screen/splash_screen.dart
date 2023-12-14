import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../blocs/auth_bloc/auth_bloc.dart';
import '../../../blocs/user_bloc/user_bloc.dart';
import '../login_screen/login_screen.dart';
import '../main_navigation_screen/main_navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<UserBloc>().add(GetUserEvent());
    Timer(
      const Duration(milliseconds: 4500),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthAuthenticated) {
                return const MainNavigationScreen().animate().slideX();
              }
              if (state is AuthUnauthenticated) {
                return const LoginScreen();
              }
              if (state is AuthLoading) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return const Scaffold();
            },
          ),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Lottie.asset(
          "assets/lottie/netflix_splash.json",
          frameRate: FrameRate(60),
          fit: BoxFit.contain,
        ));
  }
}
