import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_clone/common/bloc/bottom_nav.dart';
import 'package:whats_app_clone/common/widgets/bottom_nav.dart';
import 'package:whats_app_clone/features/chats/presentation/pages/chats_page.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final PageController pageController = PageController();

    List<Widget> pages = [
      const ChatsPage(),
      const StatusPage(),
      const CallsPage(),
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
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomNav(controller: pageController),
          ),
        ],
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: colorScheme.background,
    );
  }
}

class CallsPage extends StatelessWidget {
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
    );
  }
}

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
    );
  }
}
