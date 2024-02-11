import 'package:flutter/material.dart';
import 'package:whats_app_clone/config/routes/route_names.dart';
import 'package:whats_app_clone/config/theme/app_styles.dart';
import 'package:whats_app_clone/features/chats/presentation/pages/single_chat_page.dart';
import 'package:whats_app_clone/features/home/presentation/pages/home_page.dart';
import 'package:whats_app_clone/features/home/presentation/pages/settings_page.dart';
import 'package:whats_app_clone/features/intro/presentation/pages/welcome_page.dart';
import 'package:whats_app_clone/features/user/presentation/pages/init_profile_page.dart';
import 'package:whats_app_clone/features/user/presentation/pages/login_page.dart';
import 'package:whats_app_clone/features/user/presentation/pages/otp_page.dart';

class OnGenerateRoute {
  OnGenerateRoute._();

  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RouteNames.singleChatPage:
        return routeBuilder(const SingleChatPage());

      case RouteNames.welcomePage:
        return routeBuilder(const WelcomePage());

      case RouteNames.loginPage:
        return routeBuilder(const LoginPage());

      case RouteNames.otpPage:
        return routeBuilder(const OtpPage());

      case RouteNames.initProfilePage:
        return routeBuilder(const InitProfilePage());

      case RouteNames.homePage:
        return routeBuilder(const HomePage());

      case RouteNames.settingsPage:
        return routeBuilder(const SettingsPage());
      default:
        return routeBuilder(const NoPageFound());
    }
  }
}

MaterialPageRoute routeBuilder(Widget child) {
  return MaterialPageRoute(builder: (_) => child);
}

class NoPageFound extends StatelessWidget {
  const NoPageFound({super.key});
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        title: Text('screen not found!', style: robotoMedium),
      ),
      body: Center(
        child: Text(
          'screen not found!',
          style: robotoBold,
        ),
      ),
    );
  }
}
