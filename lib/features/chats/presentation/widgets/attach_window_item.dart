import 'package:flutter/material.dart';

class AttachWindowItem extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color color;
  final String title;

  const AttachWindowItem({
    super.key,
    required this.onTap,
    required this.color,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 70,
        height: 100,
        child: Column(
          children: [
            Container(
              width: 55,
              height: 55,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40), color: color),
              child: Icon(icon),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
