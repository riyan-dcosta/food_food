import 'package:flutter/material.dart';

class ShowToast {
  final BuildContext context;
  final String message;

  ShowToast({required this.message, required this.context});

  snackBar({
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }

  showInfo() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    snackBar();
  }

  showError() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    snackBar(backgroundColor: Colors.red.shade400);
  }

  showSuccess() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    snackBar(backgroundColor: Colors.green.shade400);
  }
}
