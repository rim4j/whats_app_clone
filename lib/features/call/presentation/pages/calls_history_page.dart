import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whats_app_clone/common/constants/dimens.dart';
import 'package:whats_app_clone/common/utils/format_date.dart';
import 'package:whats_app_clone/common/widgets/profile_widget.dart';
import 'package:whats_app_clone/config/routes/route_names.dart';
import 'package:whats_app_clone/config/theme/app_styles.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/icon_button_app.dart';

class CallsHistoryPage extends StatelessWidget {
  const CallsHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            Text("Recent", style: robotoMedium),
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
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.callContactsPage);
                    },
                    value: "Call Contacts",
                    child: Text(
                      'Call Contacts',
                      style: robotoMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: Dimens.medium),
              //   child: Text(
              //     "Recent",
              //     style: robotoMedium.copyWith(
              //       fontSize: 15,
              //     ),
              //   ),
              // ),
              const SizedBox(height: 10),
              ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
                    title: Text(
                      "Username",
                      style: robotoRegular.copyWith(fontSize: 16),
                    ),
                    subtitle: Row(
                      children: [
                        const Icon(
                          Icons.call_made,
                          color: Colors.green,
                          size: 19,
                        ),
                        const SizedBox(width: 10),
                        Text(formatDateTime(DateTime.now())),
                      ],
                    ),
                    trailing: const Icon(
                      Icons.call,
                      color: Colors.green,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
