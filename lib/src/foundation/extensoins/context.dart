import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

extension ThemeProviderExtention on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension ScreenSizeExtensions on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  EdgeInsets get screenPadding => MediaQuery.of(this).padding;

  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  double get statusBarHeight => screenPadding.top;
  double get bottomPadding => screenPadding.bottom;
}

extension MediaQueryExtensions on BuildContext {
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;
  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;
}

// TODO:
// extension LocalizationExtensions on BuildContext {
//   AppLocalizations get loc => AppLocalizations.of(this)!;
// }

extension FocusExtensions on BuildContext {
  void unfocus() {
    FocusScope.of(this).unfocus();
  }

  void requestFocus(FocusNode node) {
    FocusScope.of(this).requestFocus(node);
  }
}

// TODO:
// extension BottomSheetExtensions on BuildContext {
//   Future<T?> showModalBottomSheet<T>(WidgetBuilder builder) {
//     return showModalBottomSheet<T>(builder);
//   }
// }

extension DialogExtensions on BuildContext {
  Future<void> showAlertDialog({
    required String title,
    required String content,
    String confirmText = 'OK',
    VoidCallback? onConfirm,
  }) {
    return showDialog(
      context: this,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              // Navigator.of(context).pop();
              context.router.maybePop();

              if (onConfirm != null) onConfirm();
            },
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }
}

// context.showAlertDialog(
//   title: 'Alert',
//   content: 'This is an alert dialog',
//   onConfirm: () => print('Confirmed!'),
// );
