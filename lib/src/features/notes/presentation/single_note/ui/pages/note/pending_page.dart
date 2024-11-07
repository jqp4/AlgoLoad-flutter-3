import 'package:flutter/material.dart';

class PendingSingleNotePage extends StatelessWidget {
  const PendingSingleNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
