import 'package:flutter/material.dart';
import 'package:notes_app_with_ai/src/foundation/extensoins/context.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    required this.label,
    required this.controller,
    required this.onChanged,
    super.key,
  });

  final String label;
  final TextEditingController controller;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    const borderRadius = BorderRadius.all(Radius.circular(10));

    return TextField(
      textAlign: TextAlign.start,
      style: theme.textTheme.bodyLarge,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        hintText: label,
        labelStyle: theme.textTheme.titleMedium?.copyWith(
          color: theme.colorScheme.primary,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: theme.colorScheme.secondary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
