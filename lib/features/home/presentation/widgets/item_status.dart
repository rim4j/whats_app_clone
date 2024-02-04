import 'package:flutter/material.dart';
import 'package:scale_button/scale_button.dart';
import 'package:whats_app_clone/common/constants/dimens.dart';

class ItemStatus extends StatelessWidget {
  final VoidCallback onTap;
  const ItemStatus({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: Dimens.small, right: Dimens.small),
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
    );
  }
}
