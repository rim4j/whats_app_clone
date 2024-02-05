import 'package:flutter/material.dart';

class IconButtonApp extends StatelessWidget {
  final ColorScheme colorScheme;
  final VoidCallback onTap;
  final Icon icon;

  const IconButtonApp({
    super.key,
    required this.colorScheme,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: colorScheme.onPrimary.withAlpha(100),
        ),
        child: icon,
      ),
    );
  }
}
