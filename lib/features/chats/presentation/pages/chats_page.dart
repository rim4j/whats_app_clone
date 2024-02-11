import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scale_button/scale_button.dart';
import 'package:whats_app_clone/common/constants/dimens.dart';
import 'package:whats_app_clone/common/widgets/profile_widget.dart';
import 'package:whats_app_clone/config/routes/route_names.dart';
import 'package:whats_app_clone/config/theme/app_colors.dart';
import 'package:whats_app_clone/config/theme/app_styles.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/icon_button_app.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/item_status.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimens.small),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "amir jalali",
                    style: robotoBold.copyWith(fontSize: 18),
                  ),
                  Row(
                    children: [
                      IconButtonApp(
                        colorScheme: colorScheme,
                        icon: const Icon(FontAwesomeIcons.magnifyingGlass),
                        onTap: () {},
                      ),
                      const SizedBox(width: Dimens.small),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: colorScheme.onPrimary.withAlpha(50),
                        ),
                        child: PopupMenuButton<String>(
                          splashRadius: 25,
                          icon: const Icon(FontAwesomeIcons.ellipsisVertical,
                              color: Colors.white),
                          color: colorScheme.background,
                          onSelected: (value) {},
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteNames.settingsPage);
                              },
                              value: "Settings",
                              child: Text(
                                'Settings',
                                style: robotoMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: Dimens.large),
            //status
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  //your status
                  ScaleButton(
                    onTap: () {
                      print("your status");
                    },
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: Dimens.small, right: Dimens.small),
                          child: SizedBox(
                            width: 70,
                            height: 70,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(32),
                              child: profileWidget(),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: GradientColors.floatingButtonGradient,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            width: 30,
                            height: 30,
                            child: const Icon(Icons.add, size: 25),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //users status
                  Container(
                    width: size.width,
                    height: 70,
                    color: Colors.black,
                    child: ListView.builder(
                      shrinkWrap: false,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return ItemStatus(
                          onTap: () {
                            print(index);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Dimens.large),
            //title recent chats
            Container(
              decoration: BoxDecoration(
                color: colorScheme.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(Dimens.small),
                    child: Container(
                      width: 50,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Dimens.large),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Recent Chat",
                        style: robotoBold.copyWith(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //recent chats
            Expanded(
              child: Container(
                color: colorScheme.background,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 20,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.singleChatPage);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(Dimens.medium),
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
                            const SizedBox(width: Dimens.medium),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("daniel",
                                    style: robotoBold.copyWith(fontSize: 16)),
                                const SizedBox(height: Dimens.small),
                                Text("hey where are you", style: robotoRegular),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
