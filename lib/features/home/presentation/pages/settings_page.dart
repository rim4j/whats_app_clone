import 'package:flutter/material.dart';
import 'package:whats_app_clone/common/constants/dimens.dart';
import 'package:whats_app_clone/common/widgets/profile_widget.dart';
import 'package:whats_app_clone/config/theme/app_styles.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/icon_button_app.dart';
import 'package:whats_app_clone/features/home/presentation/widgets/settings_item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButtonApp(
                  colorScheme: colorScheme,
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: Dimens.medium),
                Text("Settings", style: robotoBold),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: profileWidget(),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Username", style: robotoBold),
                      Text("while true {code ()}", style: robotoRegular),
                    ],
                  ),
                ),
                Icon(
                  Icons.qr_code_sharp,
                  color: colorScheme.onPrimary,
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          Container(
            width: double.infinity,
            height: 0.5,
            color: colorScheme.primary,
          ),
          const SizedBox(height: 10),
          SettingsItem(
            title: "Account",
            description: "Security applications, change number",
            icon: Icons.key,
            onTap: () {},
            colorScheme: colorScheme,
          ),
          SettingsItem(
            title: "Privacy",
            description: "Block contacts, disappearing messages",
            icon: Icons.lock,
            onTap: () {},
            colorScheme: colorScheme,
          ),
          SettingsItem(
            title: "Chats",
            description: "Theme, wallpapers, chat history",
            icon: Icons.message,
            onTap: () {},
            colorScheme: colorScheme,
          ),
          SettingsItem(
            title: "Logout",
            description: "Logout from WhatsApp Clone",
            icon: Icons.exit_to_app,
            onTap: () {},
            colorScheme: colorScheme,
          ),
        ],
      ),
    );
  }
}
