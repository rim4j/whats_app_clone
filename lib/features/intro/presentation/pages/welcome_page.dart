import 'package:flutter/material.dart';
import 'package:whats_app_clone/common/constants/asset_images.dart';
import 'package:whats_app_clone/common/widgets/custom_button.dart';
import 'package:whats_app_clone/config/routes/route_names.dart';
import 'package:whats_app_clone/config/theme/app_styles.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text("Welcome to WhatsApp Clone",
                  style: robotoBold.copyWith(
                    fontSize: 20,
                    color: colorScheme.onPrimary,
                  )),
            ),
            Image.asset(AssetImages.welcomeImage),
            Column(
              children: [
                Text(
                  "Read our Privacy Policy Tap, 'Agree and Continue' to accept the Team of Service.",
                  textAlign: TextAlign.center,
                  style: robotoRegular.copyWith(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  title: "AGREE AND CONTINUE",
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.loginPage);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
