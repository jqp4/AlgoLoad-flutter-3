import 'package:flutter/material.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';

extension SnackbarExtensions on BuildContext {
  void showSnackbar(
    String message, {
    Duration duration = const Duration(milliseconds: 2000),
  }) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        MySnackBar.of(this).create(
          message,
          duration: duration,
        ),
      );
  }

  void hideSnackbar() {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
  }
}
