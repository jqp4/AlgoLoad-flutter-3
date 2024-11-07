import 'package:flutter/material.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';
import 'package:notes_app_with_ai/src/foundation/_barrel.dart';

class BottomSheetListContent extends StatelessWidget {
  const BottomSheetListContent({
    required this.items,
    super.key,
  });

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final backgroundColor = theme.colorScheme.surface;

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Material(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 64),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: items,
          ),
        ),
      ),
    );
  }
}

class BottomSheetButtonItem extends StatelessWidget {
  const BottomSheetButtonItem({
    required this.title,
    required this.onPressed,
    this.leadingIcon,
    super.key,
  });

  final String title;
  final VoidCallback onPressed;
  final IconData? leadingIcon;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leadingIcon != null) ...[
              SizedBox.square(
                dimension: 24,
                child: Center(
                  child: Icon(
                    leadingIcon!,
                    color: const Color(0xFFB7B7B7),
                  ),
                ),
              ),
              const Gap.x(16.0),
            ],
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.bodyLarge,
              ),
            ),
            const Gap.x(16.0),
            const SizedBox.square(
              dimension: 24,
              child: Center(
                child: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Color(0xFFB7B7B7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
