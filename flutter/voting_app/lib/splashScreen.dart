import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/rendering.dart';
import 'package:voting_app/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null;

  @override 
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash:
    Column(
      children: [
        Center(
          child: LottieBuilder.asset('assets/Lottie/PolicyVoteApp.json'),
        )
      ],
    ), nextScreen: const LoginPage(),
    backgroundColor: Color(0xFFC7E7F3),
    splashIconSize: 400,
    );
  }
}