import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:whats_app_clone/common/constants/animations.dart';
import 'package:whats_app_clone/config/routes/route_names.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.welcomePage, (route) => false);
    });
    super.initState();
  }

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
