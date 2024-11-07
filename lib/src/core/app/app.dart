import 'package:flutter/material.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // TODO: move to theme bloc
    final textTheme = createTextTheme(context, 'Poppins', 'Poppins');
    final materialTheme = MaterialTheme(textTheme);
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    final theme = brightness == Brightness.light ? materialTheme.light : materialTheme.dark;

    return MaterialApp.router(
      title: 'Notes with AI',
      routerConfig: _appRouter.config(),
      theme: theme,
    );
  }
}
