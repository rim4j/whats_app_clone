import 'package:flutter/material.dart';
import 'package:whats_app_clone/common/constants/dimens.dart';
import 'package:whats_app_clone/common/utils/format_date.dart';
import 'package:whats_app_clone/common/widgets/profile_widget.dart';
import 'package:whats_app_clone/config/theme/app_styles.dart';

class CallsHistoryPage extends StatelessWidget {
  const CallsHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.medium),
                child: Text(
                  "Recent",
                  style: robotoMedium.copyWith(
                    fontSize: 15,
                  ),
                ),
              ),
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
