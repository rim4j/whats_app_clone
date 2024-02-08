import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:whats_app_clone/config/theme/app_styles.dart';

class CustomToast {
  static showToastSuccess(context, String message) {
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      alignment: Alignment.topCenter,
      showProgressBar: false,
      context: context,
      closeOnClick: true,
      title: Text(
        message,
        style: robotoRegular,
      ),
      autoCloseDuration: const Duration(seconds: 5),
      icon: const Icon(Icons.check, color: Colors.green),
    );
  }

  static showToastError(context, String message) {
    toastification.show(
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      alignment: Alignment.topCenter,
      showProgressBar: false,
      context: context,
      closeOnClick: true,
      title: Text(message, style: robotoRegular),
      autoCloseDuration: const Duration(seconds: 5),
      icon: const Icon(Icons.error, color: Colors.red),
    );
  }
}
