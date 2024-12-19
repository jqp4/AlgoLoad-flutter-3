import 'package:algoload_flutter_web_app/src/foundation/extensoins/context.dart';
import 'package:flutter/material.dart';

class MyButtonContent extends StatelessWidget {
  const MyButtonContent({
    required this.title,
    required this.textColor,
    required this.isExpanded,
    super.key,
  });

  final String title;
  final Color textColor;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    final textStyle = textTheme.bodyLarge?.copyWith(
      color: textColor,
      fontWeight: FontWeight.w500,
    );

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: isExpanded
          ? Row(
              children: [
                const Spacer(),
                Text(title, style: textStyle),
                const Spacer(),
              ],
            )
          : Text(title, style: textStyle),
    );
  }
}
