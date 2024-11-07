import 'package:flutter/widgets.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';

extension LoadingOverlayExtensions on BuildContext {
  void showLoadingOverlay() {
    inject<LoadingOverlay>().show(this);
  }

  void hideLoadingOverlay() {
    inject<LoadingOverlay>().hide();
  }
}
