import 'package:flutter/material.dart';
import 'package:whats_app_clone/common/constants/dimens.dart';
import 'package:whats_app_clone/common/widgets/profile_widget.dart';
import 'package:whats_app_clone/config/theme/app_styles.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/icon_button_app.dart';

class CallContactsPage extends StatelessWidget {
  const CallContactsPage({super.key});

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
                Text("Select Contacts", style: robotoBold),
              ],
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            leading: SizedBox(
              width: 60,
              height: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26),
                child: profileWidget(),
              ),
            ),
            title: Text("Username", style: robotoRegular),
            subtitle: const Text("hey there im using whats app!"),
            trailing: const Wrap(
              children: [
                Icon(Icons.call, color: Colors.green, size: 22),
                SizedBox(width: 15),
                Icon(Icons.videocam_rounded, color: Colors.green, size: 25),
              ],
            ),
          );
        },
      ),
    );
  }
}
