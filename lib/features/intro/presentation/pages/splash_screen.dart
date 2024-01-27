import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:whats_app_clone/common/constants/animations.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        color: colorScheme.background,
        child: Center(
          child: SizedBox(
            child: Lottie.asset(
              AnimationsConst.whatsApp,
              width: size.width / 2,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
