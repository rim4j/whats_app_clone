import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whats_app_clone/common/constants/dimens.dart';
import 'package:whats_app_clone/common/widgets/profile_widget.dart';
import 'package:whats_app_clone/config/theme/app_styles.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/icon_button_app.dart';

class MyStatusPage extends StatelessWidget {
  const MyStatusPage({super.key});

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
                  Text("My Status", style: robotoBold),
                ],
              ),
            ],
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: profileWidget(),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Text(
                      GetTimeAgo.parse(
                        DateTime.now()
                            .subtract(Duration(seconds: DateTime.now().second)),
                      ),
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: colorScheme.onPrimary.withAlpha(50),
                    ),
                    child: PopupMenuButton<String>(
                      splashRadius: 25,
                      icon: const Icon(
                        FontAwesomeIcons.ellipsisVertical,
                        color: Colors.white,
                      ),
                      color: colorScheme.background,
                      onSelected: (value) {},
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          onTap: () {},
                          value: "Delete",
                          child: Text(
                            'Delete',
                            style: robotoMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
