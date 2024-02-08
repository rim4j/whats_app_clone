import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:whats_app_clone/common/widgets/custom_button.dart';
import 'package:whats_app_clone/config/routes/route_names.dart';
import 'package:whats_app_clone/config/theme/app_styles.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _otpController = TextEditingController();

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
                      "Verify your OTP",
                      style: robotoBold.copyWith(
                        fontSize: 20,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Enter your OTP for the WhatsApp Clone Verification (so that you will be moved for the further steps to complete)",
                    textAlign: TextAlign.center,
                    style: robotoRegular.copyWith(fontSize: 15),
                  ),
                  const SizedBox(height: 30),
                  _pinCodeWidget(colorScheme),
                ],
              ),
            ),
            CustomButton(
              title: "Next",
              onTap: submitCode,
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  Widget _pinCodeWidget(ColorScheme colorScheme) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          PinCodeFields(
            controller: _otpController,
            length: 6,
            activeBorderColor: colorScheme.secondary,
            onComplete: (String pinCode) {},
          ),
          const Text("Enter your 6 digit code")
        ],
      ),
    );
  }

  void submitCode() {
    if (_otpController.text.isNotEmpty) {
      Navigator.pushNamed(context, RouteNames.initProfilePage);
      print(_otpController.text);
    }
  }
}
