import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/utils/colors.dart';

import '../utils/checkuser.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: LottieBuilder.asset(
                "assets/lottie/my first.json",
              ),
            ),
          ],
        ),
        nextScreen: const CheckUser(),
        splashIconSize: 400,
        backgroundColor: AppColors.backGroundColor,
      ),
    );
  }
}
