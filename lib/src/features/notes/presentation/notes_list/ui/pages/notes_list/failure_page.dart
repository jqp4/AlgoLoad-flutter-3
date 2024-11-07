import 'package:flutter/material.dart';
import 'package:notes_app_with_ai/src/foundation/extensoins/context.dart';

class FailureNotesListPage extends StatelessWidget {
  const FailureNotesListPage({
    required this.failureDescription,
    super.key,
  });

  final String failureDescription;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Scaffold(
      body: Center(
        child: Text(
          failureDescription,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.error,
          ),
        ),
      ),
    );
  }
}
