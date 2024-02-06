import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:whats_app_clone/common/constants/dimens.dart';
import 'package:whats_app_clone/config/theme/app_colors.dart';
import 'package:whats_app_clone/config/theme/app_styles.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/icon_button_app.dart';

class Message {
  final String text;
  final bool me;
  Message({
    required this.text,
    required this.me,
  });
}

class SingleChatPage extends StatelessWidget {
  const SingleChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = [
      Message(text: "hey", me: true),
      Message(text: "yo", me: false),
      Message(text: "what are u doing", me: true),
      Message(text: "nothing ", me: false),
      Message(text: "what are u doing", me: true),
      Message(text: "nothing ", me: false),
      Message(text: "i'm heading to the mall the afternoon", me: false),
      Message(text: "yes, it's look awesome", me: true),
      Message(
          text: "But can i bring my girlfriend?She want to go to the mall",
          me: true),
      Message(text: "yes, no problem", me: false),
      Message(text: "thank you", me: true),
      Message(text: "np", me: false),
    ];

    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 80,
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
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                const SizedBox(width: Dimens.small),
                Column(
                  children: [
                    Text("Amir", style: robotoBold),
                    Text("Onlion", style: robotoRegular.copyWith(fontSize: 14)),
                  ],
                )
              ],
            ),
            IconButtonApp(
              colorScheme: colorScheme,
              icon: const Icon(FontAwesomeIcons.ellipsisVertical),
              onTap: () {
                print("open modal menu");
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final Message message = messages[index];
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  Dimens.small,
                  Dimens.small,
                  Dimens.small,
                  messages.length - 1 == index ? Dimens.xLarge : Dimens.small,
                ),
                child: Align(
                  alignment:
                      message.me ? Alignment.bottomRight : Alignment.bottomLeft,
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      gradient: message.me
                          ? const LinearGradient(
                              colors: GradientColors.message,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                          : null,
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: message.me
                            ? const Radius.circular(20)
                            : const Radius.circular(0),
                        topRight: message.me
                            ? const Radius.circular(0)
                            : const Radius.circular(20),
                        bottomLeft: const Radius.circular(20),
                        bottomRight: const Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(Dimens.medium),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(message.text),
                          const SizedBox(height: Dimens.small),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "6.37AM",
                                style: robotoRegular.copyWith(fontSize: 12),
                              ),
                              const SizedBox(width: Dimens.small),
                              message.me
                                  ? const Icon(Icons.check, size: 13)
                                  : const SizedBox(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(Dimens.small),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(Dimens.small),
                  child: Row(
                    children: [
                      const SizedBox(width: Dimens.medium),
                      GestureDetector(
                        onTap: () {
                          print("select emoji");
                        },
                        child: const Icon(Icons.emoji_emotions, size: 18),
                      ),
                      const SizedBox(width: Dimens.medium),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type a message ...",
                            hintStyle: robotoRegular,
                          ),
                        ),
                      ),
                      const SizedBox(width: Dimens.medium),
                      GestureDetector(
                          onTap: () {
                            print("select image from gallery");
                          },
                          child: const Icon(FontAwesomeIcons.image, size: 18)),
                      const SizedBox(width: Dimens.medium),
                      GestureDetector(
                          onTap: () {
                            print("select image from camera");
                          },
                          child: const Icon(FontAwesomeIcons.camera, size: 18)),
                      const SizedBox(width: Dimens.medium),
                      IconButtonApp(
                        colorScheme: colorScheme,
                        icon: const Icon(FontAwesomeIcons.paperPlane),
                        onTap: () {
                          print("send message");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
