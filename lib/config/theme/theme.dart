import 'package:flutter/material.dart';
import 'package:whats_app_clone/config/theme/app_colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  dialogTheme: const DialogTheme(
    backgroundColor: AppColorsLight.backGround,
  ),
  colorScheme: const ColorScheme.light(
    background: AppColorsLight.backGround,
    primary: AppColorsLight.primary,
    onPrimary: AppColorsDark.primary,
    secondary: AppColorsLight.secondary,
    onSecondary: AppColorsLight.backGround,
    onSecondaryContainer: AppColorsLight.primary,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  dialogTheme: const DialogTheme(backgroundColor: AppColorsDark.backGround),
  colorScheme: const ColorScheme.dark(
    background: AppColorsDark.backGround,
    primary: AppColorsDark.primary,
    onPrimary: AppColorsDark.grey,
    secondary: AppColorsDark.secondary,
    onSecondary: AppColorsDark.dark,
    onSecondaryContainer: AppColorsDark.primary,
  ),
);
