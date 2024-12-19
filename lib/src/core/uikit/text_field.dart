import 'package:flutter/material.dart';
import 'package:algoload_flutter_web_app/src/foundation/extensoins/context.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    required this.label,
    required this.controller,
    required this.onChanged,
    this.autofillHints,
    super.key,
  });

  final String label;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final List<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    const borderRadius = BorderRadius.all(Radius.circular(10));

    return TextField(
      textAlign: TextAlign.start,
      style: theme.textTheme.bodyLarge,
      onChanged: onChanged,
      controller: controller,
      autofillHints: autofillHints,
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

class MyTextFieldObscured extends StatefulWidget {
  const MyTextFieldObscured({
    required this.label,
    required this.controller,
    required this.onChanged,
    this.autofillHints,
    super.key,
  });

  final String label;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final List<String>? autofillHints;

  @override
  State<MyTextFieldObscured> createState() => _MyTextFieldObscuredState();
}

class _MyTextFieldObscuredState extends State<MyTextFieldObscured> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    const borderRadius = BorderRadius.all(Radius.circular(10));

    return TextField(
      obscureText: !_isVisible,
      textAlign: TextAlign.start,
      style: theme.textTheme.bodyLarge,
      onChanged: widget.onChanged,
      controller: widget.controller,
      autofillHints: widget.autofillHints,
      decoration: InputDecoration(
        hintText: widget.label,
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
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: IconButton(
            icon: Icon(
              _isVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _isVisible = !_isVisible;
              });
            },
          ),
        ),
      ),
    );
  }
}
