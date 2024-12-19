import 'package:flutter/material.dart';
import 'package:algoload_flutter_web_app/src/foundation/extensoins/context.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({
    required this.title,
    required this.description,
    required this.emojiIcon,
    required this.onPressed,
    super.key,
  });

  final String title;
  final String description;
  final String emojiIcon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final backgroundColor = theme.colorScheme.surface;
    final iconBackgroundColor = theme.colorScheme.surfaceContainer;

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Material(
        color: backgroundColor,
        child: InkWell(
          onTap: onPressed,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CircleAvatar(
                  backgroundColor: iconBackgroundColor,
                  child: Text(
                    emojiIcon,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox.square(
                  dimension: 24,
                  child: Center(
                    child: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Color(0xFFB7B7B7),
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
