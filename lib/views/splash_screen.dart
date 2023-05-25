import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_commerce/model/button_provider.dart';
import 'package:e_commerce/model/my_app.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 200,
      backgroundColor: const Color(0xffE5E5E5),
      splash: 'assets/images/logo.png',
      nextScreen: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthenticationProvider())
        ],
        child: const MyApp()),
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
    );
  }
}