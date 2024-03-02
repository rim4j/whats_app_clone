import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_clone/common/bloc/bottom_nav.dart';
import 'package:whats_app_clone/config/routes/on_generate_route.dart';
import 'package:whats_app_clone/config/theme/theme.dart';

import 'package:whats_app_clone/features/intro/presentation/pages/splash_page.dart';
import 'package:whats_app_clone/features/user/presentation/bloc/user_bloc.dart';
import 'package:whats_app_clone/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setup();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavCubit(),
        ),
        BlocProvider(create: (context) => locator<UserBloc>()),
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
      initialRoute: "/",
      onGenerateRoute: OnGenerateRoute.route,
      routes: {"/": (context) => const SplashPage()},
    );
  }
}
