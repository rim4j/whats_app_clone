import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_clone/common/bloc/bottom_nav.dart';
import 'package:whats_app_clone/common/widgets/bottom_nav.dart';
import 'package:whats_app_clone/features/call/presentation/pages/calls_history_page.dart';
import 'package:whats_app_clone/features/chats/presentation/pages/chats_page.dart';
import 'package:whats_app_clone/features/home/presentation/pages/contacts_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final PageController pageController = PageController();

    List<Widget> pages = [
      const ChatsPage(),
      const ContactsPage(),
      const CallsHistoryPage(),
    ];

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: pages,
            onPageChanged: (value) {
              BlocProvider.of<BottomNavCubit>(context)
                  .changeSelectedIndex(value);
            },
          ),
          Positioned(
            left: -30,
            right: -30,
            bottom: 0,
            child: BottomNav(controller: pageController),
          ),
        ],
      ),
    );
  }
}
