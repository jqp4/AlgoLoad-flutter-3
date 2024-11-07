import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFFE5E5E5);

    return const Divider(
      color: color,
      height: 8,
    );
  }
}
