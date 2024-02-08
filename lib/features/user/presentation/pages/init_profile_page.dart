import 'dart:io';

import 'package:flutter/material.dart';
import 'package:whats_app_clone/common/widgets/custom_button.dart';
import 'package:whats_app_clone/common/widgets/profile_widget.dart';
import 'package:whats_app_clone/config/routes/route_names.dart';
import 'package:whats_app_clone/config/theme/app_styles.dart';
import 'package:image_picker/image_picker.dart';

class InitProfilePage extends StatefulWidget {
  const InitProfilePage({super.key});

  @override
  State<InitProfilePage> createState() => _InitProfilePageState();
}

class _InitProfilePageState extends State<InitProfilePage> {
  final picker = ImagePicker();

  final TextEditingController _usernameController = TextEditingController();
  File? _image;

  Future pickGalleryImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 20);

    if (pickedFile == null) return;

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: Text(
                      "Profile Info",
                      style: robotoBold.copyWith(
                        fontSize: 20,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Please provide your name and optional profile photo",
                    textAlign: TextAlign.center,
                    style: robotoRegular.copyWith(fontSize: 15),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: pickGalleryImage,
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: profileWidget(image: _image),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.only(top: 1.5),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: colorScheme.primary, width: 1.5))),
                    child: TextField(
                      controller: _usernameController,
                      style: robotoRegular,
                      decoration: const InputDecoration(
                        hintText: "Username",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              title: "Next",
              onTap: () {
                Navigator.pushNamed(context, RouteNames.homePage);
              },
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
