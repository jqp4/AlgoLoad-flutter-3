import 'package:flutter/material.dart';
import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/foundation/_barrel.dart';

class MySnackBar {
  MySnackBar.of(this.context);

  final BuildContext context;

  SnackBar create(
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    final theme = context.theme;

    final backgroundColor = theme.colorScheme.inverseSurface;
    final foregroundColor = theme.colorScheme.onInverseSurface;
    final shadowColor = theme.colorScheme.outlineVariant;

    return SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              spreadRadius: 2.0,
              blurRadius: 8.0,
              offset: const Offset(2, 4),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    message,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: foregroundColor,
                    ),
                  ),
                ),
              ),
              SizedBox.square(
                dimension: 46,
                child: Center(
                  child: IconButton(
                    onPressed: context.hideSnackbar,
                    icon: Icon(
                      Icons.close_rounded,
                      color: foregroundColor,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
