import 'package:flutter/material.dart';
import 'package:notes_app_with_ai/src/core/uikit/_barrel.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    this.title = 'Button',
    this.isExpanded = false,
    this.color = ButtonColorScheme.blue,
    this.onPressed,
    super.key,
  });

  final String title;
  final VoidCallback? onPressed;

  final bool isExpanded;
  final ButtonColorScheme color;

  @override
  Widget build(BuildContext context) {
    const fontSize = 16.0;

    const outlineBorderWidth = 1.0;
    const outlineBorderColor = Color(0xFFE5E5E5);

    late final Color foregroundColor;
    late final Color backgroundColor;

    if (color == ButtonColorScheme.blue) {
      foregroundColor = const Color(0xFFFFFFFF);
      backgroundColor = const Color(0xFF00A3FF);
    } else {
      foregroundColor = const Color(0xFF00A3FF);
      backgroundColor = const Color(0xFFFFFFFF);
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        side: color == ButtonColorScheme.blue
            ? null
            : const BorderSide(
                color: outlineBorderColor,
                width: outlineBorderWidth,
              ),
        textStyle: const TextStyle(
          fontSize: fontSize,
        ),
      ),
      child: MyButtonContent(
        title: title,
        textColor: foregroundColor,
        isExpanded: isExpanded,
      ),
    );
  }
}
