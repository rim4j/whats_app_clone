import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_clone/common/bloc/bottom_nav.dart';
import 'package:whats_app_clone/config/theme/app_colors.dart';
import 'package:whats_app_clone/config/theme/app_styles.dart';

class BottomNav extends StatelessWidget {
  final PageController controller;

  const BottomNav({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height / 14;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, index) {
        return BottomAppBar(
          color: Colors.black.withOpacity(0),
          elevation: 0,
          child: Stack(
            children: [
              CustomPaint(
                size: Size(size.width, height + 6),
                painter: BottomNavCurvePainter(
                  backgroundColor: colorScheme.onSecondary,
                ),
              ),
              Center(
                heightFactor: 0.6,
                child: FloatingActionButton(
                  backgroundColor: colorScheme.background,
                  onPressed: () {
                    BlocProvider.of<BottomNavCubit>(context)
                        .changeSelectedIndex(1);
                    controller.jumpToPage(1);
                  },
                  child: Container(
                    width: size.width / 7,
                    height: size.width / 7,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: GradientColors.floatingButtonGradient,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NavBarIcon(
                      text: "Chats",
                      icon: index == 0 ? Icons.message : Icons.message,
                      selected: index == 0 ? true : false,
                      onPressed: () {
                        BlocProvider.of<BottomNavCubit>(context)
                            .changeSelectedIndex(0);
                        controller.jumpToPage(0);
                      },
                      defaultColor: colorScheme.onSecondaryContainer,
                      selectedColor: colorScheme.onPrimary,
                    ),
                    NavBarIcon(
                      text: "Calls",
                      icon: index == 2 ? Icons.call : Icons.call,
                      selected: index == 2 ? true : false,
                      onPressed: () {
                        BlocProvider.of<BottomNavCubit>(context)
                            .changeSelectedIndex(2);
                        controller.jumpToPage(2);
                      },
                      defaultColor: colorScheme.onSecondaryContainer,
                      selectedColor: colorScheme.onPrimary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BottomNavCurvePainter extends CustomPainter {
  BottomNavCurvePainter(
      {this.backgroundColor = Colors.white, this.insetRadius = 38});

  Color backgroundColor;
  double insetRadius;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 12);

    double insetCurveBeginnningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;
    double transitionToInsetCurveWidth = size.width * .05;

    path.quadraticBezierTo(
      size.width * 0.20,
      0,
      insetCurveBeginnningX - transitionToInsetCurveWidth,
      0,
    );
    path.quadraticBezierTo(
      insetCurveBeginnningX,
      0,
      insetCurveBeginnningX,
      insetRadius / 2,
    );

    path.arcToPoint(Offset(insetCurveEndX, insetRadius / 2),
        radius: const Radius.circular(10.0), clockwise: false);

    path.quadraticBezierTo(
        insetCurveEndX, 0, insetCurveEndX + transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 12);
    path.lineTo(size.width, size.height + 56);
    path.lineTo(
        0,
        size.height +
            56); //+56 here extends the navbar below app bar to include extra space on some screens (iphone 11)
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon({
    Key? key,
    required this.text,
    required this.icon,
    required this.selected,
    required this.onPressed,
    this.selectedColor = const Color(0xffFF8527),
    this.defaultColor = Colors.black54,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
        Text(
          text,
          style: robotoRegular,
        ),
      ],
    );
  }
}
