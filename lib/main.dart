import 'package:flutter/material.dart';

import 'package:whats_app_clone/features/intro/presentation/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whats App',
      home: SplashPage(),
    );
  }
}
