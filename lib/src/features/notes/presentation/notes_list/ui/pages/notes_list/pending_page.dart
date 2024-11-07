import 'package:flutter/material.dart';

class PendingNotesListPage extends StatelessWidget {
  const PendingNotesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
