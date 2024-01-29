import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_clone/common/bloc/bottom_nav.dart';
import 'package:whats_app_clone/common/widgets/main_wrapper.dart';
import 'package:whats_app_clone/config/theme/theme.dart';

import 'package:whats_app_clone/features/intro/presentation/pages/splash_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      title: 'Whats App',
      home: const MainWrapper(),
    );
  }
}
