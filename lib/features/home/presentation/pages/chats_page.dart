import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whats_app_clone/common/constants/dimens.dart';
import 'package:whats_app_clone/config/theme/app_styles.dart';
import 'package:whats_app_clone/features/home/presentation/widgets/icon_button_app.dart';
import 'package:whats_app_clone/features/home/presentation/widgets/item_status.dart';

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
                      IconButtonApp(
                        colorScheme: colorScheme,
                        icon: const Icon(FontAwesomeIcons.ellipsisVertical),
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: Dimens.large),
            //status
            Container(
              width: size.width,
              height: 70,
              color: Colors.black,
              child: ListView.builder(
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
                        print("single chat page");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(Dimens.medium),
                        child: Row(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(32),
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
