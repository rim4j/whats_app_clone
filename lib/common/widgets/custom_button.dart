import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:whats_app_clone/config/theme/app_styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool? loading;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: loading == true ? () {} : onTap,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.grey,
        backgroundColor: colorScheme.primary,
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: loading == true
          ? const SizedBox(
              height: 50,
              child: SpinKitRipple(
                color: Colors.white,
                size: 100,
              ),
            )
          : Text(
              title,
              style: robotoMedium.copyWith(
                color: Colors.white,
                // fontSize: appFontSize.mediumFontSize,
              ),
            ),
    );
  }
}
